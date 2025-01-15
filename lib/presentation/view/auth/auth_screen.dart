import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/auth_view_model.dart';
import 'package:dio/dio.dart';
import '../notification/notification_settings_screen.dart';
import '../credit/credit_earn_screen.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context);

    ref.listen(authViewModelProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          String message = localizations.translate('unknown_error');

          if (error is DioException) {
            switch (error.response?.data['code']) {
              case 'EMAIL_EXISTS':
                message = localizations.translate('email_exists');
                break;
              case 'INVALID_INPUT':
                message = localizations.translate('invalid_input');
                break;
              case 'INVALID_CREDENTIALS':
                message = localizations.translate('invalid_credentials');
                break;
              default:
                if (error.type == DioExceptionType.connectionTimeout) {
                  message = localizations.translate('server_connection_failed');
                } else {
                  message = localizations.translate('server_error');
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
        title: Text(_isLogin
            ? localizations.translate('sign_in')
            : localizations.translate('register')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: localizations.translate('email'),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: localizations.translate('password'),
                border: const OutlineInputBorder(),
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
                _isLogin
                    ? localizations.translate('sign_in')
                    : localizations.translate('sign_up'),
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
                  Text(
                    _isLogin
                        ? localizations.translate('no_account')
                        : localizations.translate('have_account'),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    _isLogin
                        ? localizations.translate('sign_up')
                        : localizations.translate('sign_in'),
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
