import 'package:btc_price_app/core/theme.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';
import 'package:btc_price_app/presentation/widget/rsi_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
    final mvrvAsync = ref.watch(indicatorViewModelProvider.select(
      (value) => value.whenData((data) => data.$3),
    ));
    final krwFormat = NumberFormat('#,###');
    final usdFormat = NumberFormat('#,###');
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Text(localizations.translate('bitnow')),
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
              ref.read(webSocketViewModelProvider.notifier).reconnect();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: wsStream.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) {
              Future.microtask(() =>
                  ref.read(webSocketViewModelProvider.notifier).reconnect());

              return ErrorDisplay(
                message: localizations.translate('connection_failed'),
                onRetry: () =>
                    ref.read(webSocketViewModelProvider.notifier).reconnect(),
              );
            },
            data: (data) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        localizations.translate('Current bitcoin price'),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (Localizations.localeOf(context).languageCode == 'ko') ...[
                  PriceDisplay(
                    label: localizations.translate('krw_price'),
                    prefix: '₩',
                    price: data.krw,
                    percentChange: data.change24h?.krw,
                    premium: data.kimchiPremium,
                    formatter: krwFormat,
                    source: localizations.translate('upbit'),
                  ),
                  const SizedBox(height: 8),
                ],
                PriceDisplay(
                  label: localizations.translate('usd_price'),
                  prefix: '\$',
                  price: data.usd,
                  percentChange: data.change24h?.usd,
                  formatter: usdFormat,
                  source: localizations.translate('binance'),
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
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      IndicatorDisplay(
                        label: localizations.translate('three_week_high_usd'),
                        value: data.high3w?.usd ?? 0,
                        formatter: usdFormat,
                        prefix: '\$',
                        dateText: data.high3w?.usdTimestamp != null
                            ? DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(data.high3w!.usdTimestamp!))
                            : null,
                      ),
                      if (Localizations.localeOf(context).languageCode == 'ko')
                        IndicatorDisplay(
                          label: localizations.translate('three_week_high_krw'),
                          value: data.high3w?.krw ?? 0,
                          formatter: krwFormat,
                          prefix: '₩',
                          dateText: data.high3w?.krwTimestamp != null
                              ? DateFormat('yyyy-MM-dd').format(
                                  DateTime.parse(data.high3w!.krwTimestamp!))
                              : null,
                        ),
                      IndicatorDisplay(
                        label: localizations.translate('dominance'),
                        value: data.dominance,
                        suffix: '%',
                      ),
                      mvrvAsync.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stack) =>
                            Text(localizations.translate('mvrv_loading_error')),
                        data: (mvrv) => IndicatorDisplay(
                          label: localizations.translate('mvrv'),
                          value: mvrv.mvrv,
                          decimalPlaces: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
