import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btc_price_app/presentation/viewmodel/indicator_view_model.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';

class MACrossWidget extends ConsumerWidget {
  const MACrossWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maCross = ref.watch(maCrossProvider);

    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: maCross.when(
          data: (data) {
            final ma20 = data.maResults?['20'];
            final ma60 = data.maResults?['60'];
            final ma120 = data.maResults?['120'];
            final ma200 = data.maResults?['200'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).translate('price_vs_ma'),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(AppLocalizations.of(context).translate('ma_description'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        )),
                const SizedBox(height: 8),
                _buildMAStatus(context, 'MA20', ma20),
                _buildMAStatus(context, 'MA60', ma60),
                _buildMAStatus(context, 'MA120', ma120),
                _buildMAStatus(context, 'MA200', ma200),
                if (data.marketDiagnosis != null) ...[
                  const SizedBox(height: 16),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '현재 추세: ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              data.marketDiagnosis?.trend ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data.marketDiagnosis?.description ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
          error: (error, stack) => const Text('이동평균선 데이터를 불러오는데 실패했습니다'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildMAStatus(BuildContext context, String period, dynamic maData) {
    if (maData == null) return const SizedBox.shrink();

    final maValue = maData['ma_value']?.toStringAsFixed(2);
    final isUpTrend = maData['confirmed_up'] == true;
    final isDownTrend = maData['confirmed_down'] == true;
    final localizations = AppLocalizations.of(context);

    Color trendColor;
    String trendText;

    if (isUpTrend) {
      trendColor = Colors.green;
      trendText = localizations.translate('above_ma');
    } else if (isDownTrend) {
      trendColor = Colors.red;
      trendText = localizations.translate('below_ma');
    } else {
      trendColor = Colors.amber;
      trendText = localizations.translate('near_ma');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(period,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text('$maValue  '),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: trendColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(trendText,
                style:
                    TextStyle(color: trendColor, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
