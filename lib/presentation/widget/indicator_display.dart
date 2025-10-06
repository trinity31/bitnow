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
  final String? tooltipMessage;

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

                    late OverlayEntry overlayEntry;
                    overlayEntry = OverlayEntry(
                      builder: (context) => Positioned(
                        top: offset.dy + 20,
                        left: offset.dx - 100,
                        child: Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 250,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Text(
                                      tooltipMessage!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: -4,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        overlayEntry.remove();
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
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
