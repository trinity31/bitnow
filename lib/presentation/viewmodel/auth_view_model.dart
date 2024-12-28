import 'package:btc_price_app/data/remote/auth_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/auth/auth_model.dart';
import 'package:dio/dio.dart';
import '../../core/network/auth_interceptor.dart';
import '../../core/constants.dart';
import '../../core/network/dio_client.dart';
import 'package:flutter/foundation.dart';

part 'auth_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  static const _tokenKey = 'auth_token';
  AuthApiClient? _client;

  AuthViewModel() {
    debugPrint('🔵 AuthViewModel created');
  }

  void dispose() {
    debugPrint('🔴 AuthViewModel disposed');
  }

  AuthApiClient get client {
    debugPrint('🔑 AuthApiClient accessed');
    _client ??= AuthApiClient(
      DioClient.getInstance(withAuth: true),
      baseUrl: ApiConstants.baseUrl,
    );
    return _client!;
  }

  @override
  Future<String?> build() async {
    debugPrint('🏗️ AuthViewModel build called');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
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
      await prefs.setString(_tokenKey, response.accessToken);

      state = AsyncValue.data(response.accessToken);
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
}
