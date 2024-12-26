import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:btc_price_app/presentation/viewmodel/price_view_model.dart';

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
              Text(
                '원화: ${krwFormat.format(prices.$1.btcKrw ?? 0)}원',
                style: const TextStyle(fontSize: 30),
              ),
              if (prices.$1.kimchiPremium != null)
                Text(
                  '김치 프리미엄: ${prices.$1.kimchiPremium?.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 24,
                    color: (prices.$1.kimchiPremium ?? 0) >= 0
                        ? Colors.red
                        : Colors.blue,
                  ),
                ),
              Text(
                '24시간 변동률: ${prices.$1.percentChange24h?.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 24,
                  color: (prices.$1.percentChange24h ?? 0) >= 0
                      ? Colors.red
                      : Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '달러: \$${usdFormat.format(prices.$2.btcUsd ?? 0)}',
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                '24시간 변동률: ${prices.$2.percentChange24h?.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 24,
                  color: (prices.$2.percentChange24h ?? 0) >= 0
                      ? Colors.red
                      : Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
