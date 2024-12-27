import 'package:btc_price_app/core/theme.dart';
import 'package:btc_price_app/presentation/widget/rsi_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:btc_price_app/presentation/viewmodel/price_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btc_price_app/presentation/widget/price_display.dart';
import 'package:btc_price_app/presentation/viewmodel/indicator_view_model.dart';
import 'package:btc_price_app/presentation/widget/indicator_display.dart';
import 'package:btc_price_app/presentation/widget/error_display.dart';
import 'package:btc_price_app/presentation/view/notification_page.dart';
import 'package:btc_price_app/presentation/view/settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceAsync = ref.watch(priceViewModelProvider);
    final indicatorAsync = ref.watch(indicatorViewModelProvider);
    final krwFormat = NumberFormat('#,###');
    final usdFormat = NumberFormat('#,###');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: const Text('비트나우'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(priceViewModelProvider.notifier).refresh();
              ref.read(indicatorViewModelProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              priceAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => ErrorDisplay(
                  message: '가격 정보를 가져오는데 실패했습니다.\n다시 시도해 주세요.',
                  onRetry: () =>
                      ref.read(priceViewModelProvider.notifier).refresh(),
                ),
                data: (prices) => Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '비트코인 현재 가격',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    PriceDisplay(
                      label: '원화',
                      prefix: '₩',
                      price: prices.$1.btcKrw,
                      percentChange: prices.$1.percentChange24h,
                      premium: prices.$1.kimchiPremium,
                      formatter: krwFormat,
                      source: '업비트',
                    ),
                    const SizedBox(height: 8),
                    PriceDisplay(
                      label: '달러',
                      prefix: '\$',
                      price: prices.$2.btcUsd,
                      percentChange: prices.$2.percentChange24h,
                      formatter: usdFormat,
                      source: 'Binance',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              indicatorAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('지표 로딩 오류: $error'),
                data: (indicators) => Column(
                  children: [
                    RsiDisplay(rsiResponse: indicators.$1),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        IndicatorDisplay(
                          label: '도미넌스',
                          value: indicators.$2.dominance,
                          suffix: '%',
                        ),
                        IndicatorDisplay(
                          label: 'MVRV',
                          value: indicators.$3.mvrv,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
