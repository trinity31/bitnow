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
import 'package:btc_price_app/presentation/widget/ma_cross_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:btc_price_app/presentation/widget/fear_greed_display.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: Constants.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _bannerAd?.load();
  }

  Widget _buildPriceSection(
      BuildContext context,
      dynamic data,
      AsyncValue<dynamic> mvrvAsync,
      AppLocalizations localizations,
      NumberFormat krwFormat,
      NumberFormat usdFormat) {
    final isKorean = Localizations.localeOf(context).languageCode == 'ko';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.translate('Current bitcoin price'),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        if (isKorean) ...[
          PriceDisplay(
            label: localizations.translate('krw_price'),
            prefix: '₩',
            price: data.krw,
            percentChange: data.change24h?.krw,
            premium: data.kimchiPremium,
            formatter: krwFormat,
            source: localizations.translate('upbit'),
          ),
          const SizedBox(height: 16),
        ],
        PriceDisplay(
          label: localizations.translate('usd_price'),
          prefix: '\$',
          price: data.usd,
          percentChange: data.change24h?.usd,
          formatter: usdFormat,
          source: localizations.translate('binance'),
        ),
        if (!isKorean) ...[
          const SizedBox(height: 16),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3.2,
            ),
            childrenDelegate: SliverChildListDelegate([
              IndicatorDisplay(
                label: localizations.translate('dominance'),
                value: data.dominance,
                suffix: '%',
                isCompact: true,
              ),
              mvrvAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) =>
                    Text(localizations.translate('mvrv_loading_error')),
                data: (mvrv) => IndicatorDisplay(
                  label: localizations.translate('mvrv'),
                  value: mvrv.mvrv,
                  decimalPlaces: 2,
                  isCompact: true,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.8,
            ),
            childrenDelegate: SliverChildListDelegate([
              IndicatorDisplay(
                label: localizations.translate('three_week_high_usd'),
                value: data.high3w?.usd ?? 0,
                formatter: usdFormat,
                prefix: '\$',
                dateText: data.high3w?.usdTimestamp != null
                    ? DateFormat('yyyy-MM-dd')
                        .format(DateTime.parse(data.high3w!.usdTimestamp!))
                    : null,
              ),
              if (Localizations.localeOf(context).languageCode == 'ko')
                IndicatorDisplay(
                  label: localizations.translate('three_week_high_krw'),
                  value: data.high3w?.krw ?? 0,
                  formatter: krwFormat,
                  prefix: '₩',
                  dateText: data.high3w?.krwTimestamp != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(data.high3w!.krwTimestamp!))
                      : null,
                ),
            ]),
          ),
        ],
      ],
    );
  }

  Widget _buildIndicatorSection(
      BuildContext context,
      dynamic data,
      AsyncValue<dynamic> mvrvAsync,
      AppLocalizations localizations,
      NumberFormat krwFormat,
      NumberFormat usdFormat) {
    final isKorean = Localizations.localeOf(context).languageCode == 'ko';
    return Column(
      children: [
        RsiDisplay(
          rsiResponse: RsiResponse(
            min15: RsiData(rsi: data.rsi?.min15),
            hour1: RsiData(rsi: data.rsi?.hour1),
            hour4: RsiData(rsi: data.rsi?.hour4),
            day1: RsiData(rsi: data.rsi?.day1),
          ),
        ),
        const SizedBox(height: 16),
        const FearGreedDisplay(),
        if (isKorean) ...[
          const SizedBox(height: 16),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3.2,
            ),
            childrenDelegate: SliverChildListDelegate([
              IndicatorDisplay(
                label: localizations.translate('dominance'),
                value: data.dominance,
                suffix: '%',
                isCompact: true,
              ),
              mvrvAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) =>
                    Text(localizations.translate('mvrv_loading_error')),
                data: (mvrv) => IndicatorDisplay(
                  label: localizations.translate('mvrv'),
                  value: mvrv.mvrv,
                  decimalPlaces: 2,
                  isCompact: true,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.8,
            ),
            childrenDelegate: SliverChildListDelegate([
              IndicatorDisplay(
                label: localizations.translate('three_week_high_usd'),
                value: data.high3w?.usd ?? 0,
                formatter: usdFormat,
                prefix: '\$',
                dateText: data.high3w?.usdTimestamp != null
                    ? DateFormat('yyyy-MM-dd')
                        .format(DateTime.parse(data.high3w!.usdTimestamp!))
                    : null,
              ),
              if (Localizations.localeOf(context).languageCode == 'ko')
                IndicatorDisplay(
                  label: localizations.translate('three_week_high_krw'),
                  value: data.high3w?.krw ?? 0,
                  formatter: krwFormat,
                  prefix: '₩',
                  dateText: data.high3w?.krwTimestamp != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(data.high3w!.krwTimestamp!))
                      : null,
                ),
            ]),
          ),
        ],
      ],
    );
  }

  Widget _buildBannerAd() {
    return _isAdLoaded && _bannerAd != null
        ? Container(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            alignment: Alignment.center,
            child: AdWidget(ad: _bannerAd!),
          )
        : Container(
            width: 320,
            height: 50,
            alignment: Alignment.center,
            child: const Text('광고 로딩 중...'),
          );
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final wsStream = ref.watch(webSocketViewModelProvider);
    final mvrvAsync = ref.watch(indicatorViewModelProvider
        .select((value) => value.whenData((data) => data.$3)));
    final krwFormat = NumberFormat('#,###');
    final usdFormat = NumberFormat('#,###');
    final localizations = AppLocalizations.of(context);
    final orientation = MediaQuery.of(context).orientation;

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: wsStream.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) {
                    Future.microtask(() => ref
                        .read(webSocketViewModelProvider.notifier)
                        .reconnect());
                    return ErrorDisplay(
                      message: localizations.translate('connection_failed'),
                      onRetry: () => ref
                          .read(webSocketViewModelProvider.notifier)
                          .reconnect(),
                    );
                  },
                  data: (data) => orientation == Orientation.landscape
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: _buildPriceSection(
                                    context,
                                    data,
                                    mvrvAsync,
                                    localizations,
                                    krwFormat,
                                    usdFormat),
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    _buildIndicatorSection(
                                        context,
                                        data,
                                        mvrvAsync,
                                        localizations,
                                        krwFormat,
                                        usdFormat),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                      indent: 16,
                                      endIndent: 16,
                                    ),
                                    const MACrossWidget(),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, right: 16),
                              child: _buildPriceSection(
                                  context,
                                  data,
                                  mvrvAsync,
                                  localizations,
                                  krwFormat,
                                  usdFormat),
                            ),
                            const SizedBox(height: 16),
                            _buildIndicatorSection(context, data, mvrvAsync,
                                localizations, krwFormat, usdFormat),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                              indent: 16,
                              endIndent: 16,
                            ),
                            const MACrossWidget(),
                            const SizedBox(height: 24),
                          ],
                        ),
                ),
              ),
            ),
          ),
          _buildBannerAd(),
        ],
      ),
    );
  }
}
