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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formatter != null
                ? '${prefix ?? ''}${formatter!.format(value ?? 0)}'
                : '${prefix ?? ''}${value?.toStringAsFixed(decimalPlaces ?? 1)}${suffix ?? ''}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          if (dateText != null)
            Text(
              dateText!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
