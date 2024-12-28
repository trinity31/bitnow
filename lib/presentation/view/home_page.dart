import 'package:btc_price_app/core/theme.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
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
import 'notification/notification_settings_screen.dart';
import 'settings/settings_screen.dart';
import 'package:btc_price_app/presentation/viewmodel/websocket_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wsStream = ref.watch(webSocketViewModelProvider);
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
                  builder: (context) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
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
          child: wsStream.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => ErrorDisplay(
              message: '연결에 실패했습니다.\n다시 시도해 주세요.',
              onRetry: () =>
                  ref.read(webSocketViewModelProvider.notifier).reconnect(),
            ),
            data: (data) => Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '비트코인 현재 가격',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                PriceDisplay(
                  label: '원화',
                  prefix: '₩',
                  price: data.krw,
                  percentChange: data.change24h?.krw,
                  premium: data.kimchiPremium,
                  formatter: krwFormat,
                  source: '업비트',
                ),
                const SizedBox(height: 8),
                PriceDisplay(
                  label: '달러',
                  prefix: '\$',
                  price: data.usd,
                  percentChange: data.change24h?.usd,
                  formatter: usdFormat,
                  source: 'Binance',
                ),
                const SizedBox(height: 16),
                RsiDisplay(
                  rsiResponse: RsiResponse(
                    min15: RsiData(rsi: data.rsi?.min15),
                    hour1: RsiData(rsi: data.rsi?.hour1),
                    hour4: RsiData(rsi: data.rsi?.hour4),
                    day1: RsiData(rsi: data.rsi?.day1),
                  ),
                ),
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
                      value: data.dominance,
                      suffix: '%',
                    ),
                    IndicatorDisplay(
                      label: 'MVRV',
                      value: data.mvrv,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
