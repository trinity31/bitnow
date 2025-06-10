import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../utils/print.dart';
import 'alert_view_model.dart';
import '../../data/model/request/fcm_token_request.dart';
import '../../data/remote/auth_api_client.dart';
import '../../domain/model/auth/auth_model.dart';
import '../../domain/model/user.dart';

part 'auth_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  static const _tokenKey = 'auth_token';
  static const _emailKey = 'user_email';
  static const _fcmTokenKey = 'fcm_token';
  static const _isAdminKey = 'is_admin';
  AuthApiClient? _client;

  AuthViewModel() {
    safePrint('🔵 AuthViewModel created');
  }

  void dispose() {
    safePrint('🔴 AuthViewModel disposed');
  }

  AuthApiClient get client {
    safePrint('🔑 AuthApiClient accessed');
    _client ??= AuthApiClient(
      DioClient.getInstance(withAuth: true),
      baseUrl: ApiConstants.baseUrl,
    );
    return _client!;
  }

  @override
  Future<User?> build() async {
    safePrint('🏗️ AuthViewModel build called');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    if (token == null) return null;

    final isAdmin = prefs.getBool(_isAdminKey) ?? false;

    final user = User(fcmToken: token, isAdmin: isAdmin);
    state = AsyncValue.data(user);

    final savedFcmToken = prefs.getString(_fcmTokenKey);
    if (savedFcmToken != null) {
      await updateFcmToken(savedFcmToken);
    }

    return user;
  }

  Future<void> register(String email, String password, String? fcmToken) async {
    state = const AsyncValue.loading();
    try {
      final request = AuthRequest(
        email: email,
        password: password,
        fcmToken: fcmToken,
      );
      await client.register(request);
      await login(email, password);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final request = AuthRequest(email: email, password: password);
      final response = await client.login(request);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, response.accessToken ?? '');
      await prefs.setString(_emailKey, email);
      await prefs.setBool(_isAdminKey, response.user?.isAdmin ?? false);

      // 로그인 성공 후 FCM 토큰 새로 가져오기
      String? fcmToken;
      try {
        final token = await FirebaseMessaging.instance.getToken();
        if (token != null) {
          fcmToken = token;
          await prefs.setString(_fcmTokenKey, token);
          await updateFcmToken(token);
          safePrint('✅ FCM 토큰 업데이트 성공');
        } else {
          safePrint('⚠️ FCM 토큰을 가져올 수 없음');
        }
      } catch (e) {
        safePrint('⚠️ FCM 토큰 가져오기 실패: $e');
      }

      final user = User(
        fcmToken: fcmToken ?? '',
        isAdmin: response.user?.isAdmin ?? false,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> logout() async {
    // 로컬 상태 먼저 초기화
    final prefs = await SharedPreferences.getInstance();
    final hadToken = prefs.containsKey(_tokenKey);

    // 로컬 저장소에서 토큰, 사용자 정보, FCM 토큰 제거
    await prefs.remove(_tokenKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_isAdminKey);
    await prefs.remove(_fcmTokenKey);

    // 상태 초기화
    state = const AsyncValue.data(null);

    // 알림 설정 관련 상태 초기화
    ref.invalidate(alertViewModelProvider);

    // 서버에 로그아웃을 알리기 전에 로컬 상태를 먼저 업데이트
    if (hadToken) {
      try {
        // 서버에 로그아웃 알리기 (실패해도 무시)
        await client.logout();
      } catch (e) {
        // 401 에러를 포함한 모든 에러는 무시 (이미 로그아웃된 상태일 수 있음)
        safePrint('로그아웃 API 호출 중 오류가 발생했지만 무시합니다: $e');
      }
    }
  }

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    try {
      await client.deleteAccount();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateFcmToken(String token) async {
    try {
      final currentLocale = Platform.localeName.split('_')[0];

      await client.updateFcmToken(
        FcmTokenRequest(
          fcmToken: token,
          locale: currentLocale,
        ).toJson(),
      );

      safePrint('✅ FCM 토큰 업데이트 성공');
    } on DioException catch (e) {
      safePrint('❌ FCM 토큰 업데이트 실패 (${e.response?.statusCode}): ${e.message}');
      if (e.response?.statusCode == 401) {
        safePrint('🔒 인증 실패: 토큰이 만료되었거나 유효하지 않습니다.');
      }
    } catch (e, stackTrace) {
      safePrint('❌ FCM 토큰 업데이트 중 오류 발생: $e');
      safePrint('Stack trace: $stackTrace');
    }
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  bool get isAdmin => state.value?.isAdmin ?? false;
}
