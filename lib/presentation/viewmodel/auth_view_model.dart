import 'package:btc_price_app/data/remote/auth_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/auth/auth_model.dart';
import '../../domain/model/user.dart';
import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import '../../utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Localizations;
import 'dart:io' show Platform;
import '../../data/model/request/fcm_token_request.dart';

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

      final savedFcmToken = prefs.getString(_fcmTokenKey);

      safePrint('savedFcmToken: $savedFcmToken');

      final user = User(
        fcmToken: savedFcmToken ?? '',
        isAdmin: response.user?.isAdmin ?? false,
      );
      state = AsyncValue.data(user);

      if (savedFcmToken != null) {
        await updateFcmToken(savedFcmToken);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await client.logout();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_emailKey);
      await prefs.remove(_isAdminKey);

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
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
    } catch (e) {
      safePrint('FCM 토큰 업데이트 실패: $e');
    }
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  bool get isAdmin => state.value?.isAdmin ?? false;
}
