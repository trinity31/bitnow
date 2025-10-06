import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:btc_price_app/core/theme.dart';

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
  final String? tooltipMessage;
  final Color? valueColor;

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
    this.tooltipMessage,
    this.valueColor,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$label:',
                style: TextStyle(
                  fontSize: isCompact ? 13 : 14,
                  color: Colors.grey,
                ),
              ),
              if (tooltipMessage != null) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    final overlay = Overlay.of(context);
                    final renderBox = context.findRenderObject() as RenderBox;
                    final offset = renderBox.localToGlobal(Offset.zero);
                    final screenWidth = MediaQuery.of(context).size.width;

                    const tooltipWidth = 250.0;
                    double leftPosition = offset.dx - 100;

                    // 화면 왼쪽 밖으로 나가지 않도록 조정
                    if (leftPosition < 16) {
                      leftPosition = 16;
                    }
                    // 화면 오른쪽 밖으로 나가지 않도록 조정
                    if (leftPosition + tooltipWidth > screenWidth - 16) {
                      leftPosition = screenWidth - tooltipWidth - 16;
                    }

                    late OverlayEntry overlayEntry;
                    overlayEntry = OverlayEntry(
                      builder: (context) => Positioned(
                        top: offset.dy + 20,
                        left: leftPosition,
                        child: Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 250,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppTheme.cardColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4, right: 32),
                                    child: Text(
                                      tooltipMessage!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: GestureDetector(
                                      onTap: () {
                                        overlayEntry.remove();
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    overlay.insert(overlayEntry);

                    Future.delayed(const Duration(seconds: 5), () {
                      if (overlayEntry.mounted) {
                        overlayEntry.remove();
                      }
                    });
                  },
                  child: Icon(
                    Icons.info_outline,
                    size: isCompact ? 14 : 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 2),
          Text(
            (value == null || value == 0)
                ? 'N/A'
                : (formatter != null
                    ? '${prefix ?? ''}${formatter!.format(value!)}'
                    : '${prefix ?? ''}${value!.toStringAsFixed(decimalPlaces ?? 1)}${suffix ?? ''}'),
            style: TextStyle(
              fontSize: isCompact ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: valueColor,
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
