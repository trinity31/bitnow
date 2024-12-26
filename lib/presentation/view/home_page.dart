import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:btc_price_app/presentation/viewmodel/price_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btc_price_app/presentation/widget/price_display.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceAsync = ref.watch(priceViewModelProvider);
    final krwFormat = NumberFormat('#,###');
    final usdFormat = NumberFormat('#,###');

    return Scaffold(
      appBar: AppBar(
        title: const Text('비트나우'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.read(priceViewModelProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Center(
        child: priceAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(
            '오류가 발생했습니다: $error',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          data: (prices) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PriceDisplay(
                label: '원화',
                suffix: '원',
                price: prices.$1.btcKrw,
                percentChange: prices.$1.percentChange24h,
                premium: prices.$1.kimchiPremium,
                formatter: krwFormat,
              ),
              const SizedBox(height: 20),
              PriceDisplay(
                label: '달러',
                prefix: '\$',
                price: prices.$2.btcUsd,
                percentChange: prices.$2.percentChange24h,
                formatter: usdFormat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
