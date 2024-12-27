import 'package:flutter/material.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btc_price_app/core/theme.dart';

class RsiDisplay extends StatelessWidget {
  final RsiResponse rsiResponse;

  const RsiDisplay({
    super.key,
    required this.rsiResponse,
  });

  Widget _buildRsiItem(String interval, RsiData? data) {
    if (data == null) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interval,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.secondaryTextColor,
                  ),
                ),
                Text(
                  '${data.rsi?.toStringAsFixed(1)}',
                  style: GoogleFonts.robotoMono(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (data.rsi != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: data.rsi! / 100,
                  backgroundColor: AppTheme.backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    data.rsi! >= 70
                        ? Colors.red
                        : data.rsi! <= 30
                            ? Colors.blue
                            : AppTheme.primaryColor,
                  ),
                  minHeight: 8,
                ),
              ),
            const SizedBox(height: 4),
            Text(
              data.signal ?? '',
              style: TextStyle(
                fontSize: 14,
                color: data.signal == 'overbought'
                    ? Colors.red
                    : data.signal == 'oversold'
                        ? Colors.blue
                        : AppTheme.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'RSI',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            _buildRsiItem('15분', rsiResponse.min15),
            _buildRsiItem('1시간', rsiResponse.hour1),
            _buildRsiItem('4시간', rsiResponse.hour4),
            _buildRsiItem('1일', rsiResponse.day1),
          ],
        ),
      ],
    );
  }
}