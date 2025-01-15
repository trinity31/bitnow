import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:btc_price_app/core/theme.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';

class PriceDisplay extends StatelessWidget {
  final String label;
  final String? prefix;
  final String? suffix;
  final double? price;
  final double? percentChange;
  final double? premium;
  final NumberFormat formatter;
  final String source;

  const PriceDisplay({
    super.key,
    required this.label,
    this.prefix,
    this.suffix,
    required this.price,
    required this.percentChange,
    this.premium,
    required this.formatter,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    if (prefix != null)
                      Text(
                        prefix!,
                        style: GoogleFonts.robotoMono(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    Text(
                      formatter.format(price ?? 0),
                      style: GoogleFonts.robotoMono(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    if (suffix != null)
                      Text(suffix!,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AppTheme.secondaryTextColor,
                          )),
                  ],
                ),
                if (premium != null)
                  _buildIndicator(
                    '김치 프리미엄',
                    premium!,
                    suffix: '%',
                  ),
                if (percentChange != null)
                  _buildIndicator(
                    localizations.translate('change_24h'),
                    percentChange ?? 0,
                    suffix: '%',
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 24,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.primaryColor.withOpacity(0.3),
              ),
            ),
            child: Text(
              source,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.secondaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(String label, double value, {String? suffix}) {
    final isPositive = value >= 0;
    final color = isPositive ? Colors.green : Colors.red;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              color: AppTheme.secondaryTextColor,
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${value.toStringAsFixed(2)}${suffix ?? ''}',
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
