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
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
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
                    color: AppTheme.accentColor,
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
                            : AppTheme.accentColor,
                  ),
                  minHeight: 8,
                ),
              ),
            // const SizedBox(height: 8),
            // Text(
            //   data.signal ?? '',
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: data.signal == 'overbought'
            //         ? Colors.red
            //         : data.signal == 'oversold'
            //             ? Colors.blue
            //             : AppTheme.secondaryTextColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'RSI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '(Binance)',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.8,
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
