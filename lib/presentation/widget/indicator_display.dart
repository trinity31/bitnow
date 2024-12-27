import 'package:flutter/material.dart';

class IndicatorDisplay extends StatelessWidget {
  final String label;
  final double? value;
  final String? suffix;
  final bool showProgress;

  const IndicatorDisplay({
    super.key,
    required this.label,
    required this.value,
    this.suffix,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$label: ${value?.toStringAsFixed(1)}${suffix ?? ''}',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
