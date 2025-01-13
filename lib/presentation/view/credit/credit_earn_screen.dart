import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/credit_view_model.dart';
import '../../../services/ad_service.dart';
import '../../view/auth/auth_screen.dart';
import '../../viewmodel/auth_view_model.dart';

class CreditEarnScreen extends ConsumerStatefulWidget {
  const CreditEarnScreen({super.key});

  @override
  ConsumerState<CreditEarnScreen> createState() => _CreditEarnScreenState();
}

class _CreditEarnScreenState extends ConsumerState<CreditEarnScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    return authState.when(
      data: (token) {
        if (token == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('크레딧 적립'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '크레딧을 적립하려면 로그인이 필요합니다',
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
                          builder: (context) => const AuthScreen(
                            source: 'credit',
                          ),
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
            title: const Text('크레딧 적립'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '현재 크레딧',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      ref.watch(creditViewModelProvider).when(
                            data: (credit) => Row(
                              children: [
                                const Icon(Icons.copyright, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  '${credit.balance}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            loading: () => const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            error: (_, __) => const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                          ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '광고 시청하고 크레딧 받기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '광고 1회 시청당 1크레딧이 적립됩니다.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() => _isLoading = true);
                          try {
                            final adService = ref.read(adServiceProvider);
                            final earnedReward =
                                await adService.showRewardedAd();

                            if (earnedReward && mounted) {
                              await ref
                                  .read(creditViewModelProvider.notifier)
                                  .earnCreditFromAd();

                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('크레딧이 적립되었습니다')),
                                );
                              }
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          } finally {
                            if (mounted) {
                              setState(() => _isLoading = false);
                            }
                          }
                        },
                  icon: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.play_circle_outline),
                  label: Text(
                    _isLoading ? '광고 로드 중...' : '광고 시청하기',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Icon(Icons.error_outline, color: Colors.red),
    );
  }
}
