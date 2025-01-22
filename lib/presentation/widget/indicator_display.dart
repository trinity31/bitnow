import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IndicatorDisplay extends StatelessWidget {
  final String label;
  final double? value;
  final String? prefix;
  final String? suffix;
  final int? decimalPlaces;
  final NumberFormat? formatter;
  final String? secondaryText;
  final String? dateText;
  final bool isCompact;

  const IndicatorDisplay({
    super.key,
    required this.label,
    required this.value,
    this.prefix,
    this.suffix,
    this.decimalPlaces,
    this.formatter,
    this.secondaryText,
    this.dateText,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: isCompact ? 2 : 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: isCompact ? 13 : 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            formatter != null
                ? '${prefix ?? ''}${formatter!.format(value ?? 0)}'
                : '${prefix ?? ''}${value?.toStringAsFixed(decimalPlaces ?? 1)}${suffix ?? ''}',
            style: TextStyle(
              fontSize: isCompact ? 16 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (dateText != null) ...[
            const SizedBox(height: 2),
            Text(
              dateText!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
