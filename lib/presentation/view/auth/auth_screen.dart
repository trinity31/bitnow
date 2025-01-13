import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/auth_view_model.dart';
import 'package:dio/dio.dart';
import '../notification/notification_settings_screen.dart';
import '../credit/credit_earn_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  final String source;

  const AuthScreen({
    super.key,
    required this.source,
  });

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          String message = '알 수 없는 오류가 발생했습니다';

          if (error is DioException) {
            switch (error.response?.data['code']) {
              case 'EMAIL_EXISTS':
                message = '이미 등록된 이메일입니다';
                break;
              case 'INVALID_INPUT':
                message = '잘못된 입력입니다';
                break;
              case 'INVALID_CREDENTIALS':
                message = '이메일 또는 비밀번호가 올바르지 않습니다';
                break;
              default:
                if (error.type == DioExceptionType.connectionTimeout) {
                  message = '서버 연결에 실패했습니다';
                } else {
                  message = '서버 오류가 발생했습니다';
                }
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
            ),
          );
        },
        data: (token) {
          if (token != null) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => widget.source == 'credit'
                    ? const CreditEarnScreen()
                    : const NotificationSettingsScreen(),
              ),
              (route) => route.isFirst,
            );
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? '로그인' : '회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 20,
                ),
                minimumSize: const Size(200, 60),
              ),
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (_isLogin) {
                  await ref
                      .read(authViewModelProvider.notifier)
                      .login(email, password);
                } else {
                  await ref
                      .read(authViewModelProvider.notifier)
                      .register(email, password, null);
                }
              },
              child: Text(
                _isLogin ? '로그인' : '회원가입',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isLogin)
                    const Text(
                      '아직 계정이 없다면? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  else
                    const Text(
                      '이미 계정이 있다면? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  Text(
                    _isLogin ? '회원가입하기' : '로그인하기',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
