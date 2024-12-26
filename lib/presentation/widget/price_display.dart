import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PriceDisplay extends StatelessWidget {
  final String label;
  final String? prefix;
  final String? suffix;
  final double? price;
  final double? percentChange;
  final double? premium;
  final NumberFormat formatter;

  const PriceDisplay({
    super.key,
    required this.label,
    this.prefix,
    this.suffix,
    required this.price,
    required this.percentChange,
    this.premium,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('$label: ${prefix ?? ''}',
                style: const TextStyle(fontSize: 24)),
            Text(
              formatter.format(price ?? 0),
              style: GoogleFonts.roboto(
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (suffix != null)
              Text(suffix!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Pretendard',
                  )),
          ],
        ),
        if (premium != null)
          Text(
            '김치 프리미엄: ${premium?.toStringAsFixed(2)}%',
            style: TextStyle(
              fontSize: 24,
              color: (premium ?? 0) >= 0 ? Colors.red : Colors.blue,
            ),
          ),
        Text(
          '24시간 변동률: ${percentChange?.toStringAsFixed(2)}%',
          style: TextStyle(
            fontSize: 24,
            color: (percentChange ?? 0) >= 0 ? Colors.red : Colors.blue,
          ),
        ),
      ],
    );
  }
}
