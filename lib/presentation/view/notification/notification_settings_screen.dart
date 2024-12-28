import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_screen.dart';
import '../../viewmodel/auth_view_model.dart';

class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    return authState.when(
      data: (token) {
        if (token == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                '알림 설정',
                style: TextStyle(fontSize: 24),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '알림을 설정하려면 로그인이 필요합니다',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      ).then((_) {
                        ref.refresh(authViewModelProvider);
                      });
                    },
                    child: const Text(
                      '로그인하기',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              '알림 설정',
              style: TextStyle(fontSize: 24),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              // 알림 설정 옵션들...
            ],
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('오류가 발생했습니다: $error'),
        ),
      ),
    );
  }
}
