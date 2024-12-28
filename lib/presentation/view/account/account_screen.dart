import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/auth_view_model.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 계정',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: authState.when(
        data: (token) {
          if (token == null) {
            return const Center(
              child: Text('로그인이 필요합니다'),
            );
          }

          return ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '계정 설정',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<String?>(
                future: ref.read(authViewModelProvider.notifier).getUserEmail(),
                builder: (context, snapshot) {
                  return ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(snapshot.data ?? '이메일 정보 없음'),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('로그아웃'),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('로그아웃'),
                      content: const Text('정말 로그아웃하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('로그아웃'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    await ref.read(authViewModelProvider.notifier).logout();
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: const Text(
                  '계정 탈퇴',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('계정 탈퇴'),
                      content: const Text(
                        '정말 탈퇴하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('탈퇴'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    try {
                      await ref
                          .read(authViewModelProvider.notifier)
                          .deleteAccount();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('계정이 삭제되었습니다'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // 설정 화면까지 모두 닫고 홈으로 이동
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('계정 삭제 실패: ${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  }
                },
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text('오류가 발생했습니다: $error'),
        ),
      ),
    );
  }
}
