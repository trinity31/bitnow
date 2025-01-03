import 'package:flutter/material.dart';

class IndicatorDisplay extends StatelessWidget {
  final String label;
  final double? value;
  final String? suffix;
  final bool showProgress;
  final int decimalPlaces;

  const IndicatorDisplay({
    super.key,
    required this.label,
    required this.value,
    this.suffix,
    this.showProgress = false,
    this.decimalPlaces = 1,
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
            Text(
              '$label: ',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Text(
              '${value?.toStringAsFixed(decimalPlaces)}${suffix ?? ''}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
