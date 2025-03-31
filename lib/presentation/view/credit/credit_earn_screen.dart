import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/credit_view_model.dart';
import '../../../services/ad_service.dart';
import '../../view/auth/auth_screen.dart';
import '../../viewmodel/auth_view_model.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context);

    return authState.when(
      data: (token) {
        if (token == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.translate('credit_earn')),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.translate('login_required_credit'),
                    style: const TextStyle(
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
                    child: Text(
                      localizations.translate('sign_in'),
                      style: const TextStyle(
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
            title: Text(localizations.translate('credit_earn')),
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
                      Text(
                        localizations.translate('current_credits'),
                        style: const TextStyle(
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
                // Text(
                //   localizations.translate('watch_ads_title'),
                //   style: const TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // Text(
                //   localizations.translate('watch_ads_description'),
                //   style: const TextStyle(
                //     color: Colors.grey,
                //   ),
                // ),
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
                                  SnackBar(
                                    content: Text(localizations
                                        .translate('credit_earned')),
                                  ),
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
                    _isLoading
                        ? localizations.translate('loading_ad')
                        : localizations.translate('watch_ad'),
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
