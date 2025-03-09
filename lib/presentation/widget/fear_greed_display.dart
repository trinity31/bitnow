import 'package:flutter/material.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btc_price_app/presentation/viewmodel/indicator_view_model.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';
import 'dart:math';

class FearGreedDisplay extends ConsumerWidget {
  const FearGreedDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indicatorAsync = ref.watch(indicatorViewModelProvider);
    final localizations = AppLocalizations.of(context);

    return indicatorAsync.when(
      data: (data) {
        final fearGreed = data.$4;
        if (fearGreed == null) {
          return const SizedBox.shrink();
        }

        return _buildFearGreedCard(context, fearGreed, localizations);
      },
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text('오류 발생: $error')),
        ),
      ),
    );
  }

  Widget _buildFearGreedCard(BuildContext context, FearGreedResponse index,
      AppLocalizations localizations) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.translate('fear_greed_index'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index.value ?? 0}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _getClassificationColor(index.classification),
                      ),
                    ),
                    Text(
                      _getLocalizedClassification(
                          context, index.classification),
                      style: TextStyle(
                        fontSize: 16,
                        color: _getClassificationColor(index.classification),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildRainbowGauge(index.value ?? 0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRainbowGauge(int value) {
    return SizedBox(
      width: 150,
      height: 90,
      child: CustomPaint(
        painter: RainbowGaugePainter(value),
      ),
    );
  }

  String _getLocalizedClassification(
      BuildContext context, String? classification) {
    final locale = Localizations.localeOf(context).languageCode;

    if (classification == null) {
      return locale == 'ko' ? '정보 없음' : 'No Data';
    }

    // 한국어인 경우 한글로 표시
    if (locale == 'ko') {
      return _getKoreanClassification(classification);
    }

    // 영어 또는 기타 언어인 경우 영어로 표시
    switch (classification.toLowerCase()) {
      case 'extreme_fear':
        return 'Extreme Fear';
      case 'fear':
        return 'Fear';
      case 'neutral':
        return 'Neutral';
      case 'greed':
        return 'Greed';
      case 'extreme_greed':
        return 'Extreme Greed';
      case 'extreme fear':
        return 'Extreme Fear';
      case 'extreme greed':
        return 'Extreme Greed';
      default:
        return classification;
    }
  }

  String _getKoreanClassification(String? classification) {
    if (classification == null) return '정보 없음';

    switch (classification.toLowerCase()) {
      case 'extreme fear':
        return '극도의 공포';
      case 'fear':
        return '공포';
      case 'neutral':
        return '중립';
      case 'greed':
        return '탐욕';
      case 'extreme greed':
        return '극도의 탐욕';
      case 'extreme_fear':
        return '극도의 공포';
      case 'extreme_greed':
        return '극도의 탐욕';
      default:
        return classification;
    }
  }

  Color _getClassificationColor(String? classification) {
    if (classification == null) return Colors.grey;

    switch (classification.toLowerCase()) {
      case 'extreme fear':
      case 'extreme_fear':
        return Colors.red.shade800;
      case 'fear':
        return Colors.red.shade400;
      case 'neutral':
        return Colors.yellow;
      case 'greed':
        return Colors.green.shade400;
      case 'extreme greed':
      case 'extreme_greed':
        return Colors.green.shade800;
      default:
        return Colors.grey;
    }
  }
}

class RainbowGaugePainter extends CustomPainter {
  final int value;

  RainbowGaugePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final arcHeight = size.height * 0.6;
    final rect = Rect.fromLTWH(0, 0, size.width, arcHeight * 2);
    const strokeWidth = 15.0;

    final gradient = LinearGradient(
      colors: [
        Colors.red.shade800,
        Colors.red.shade400,
        Colors.yellow,
        Colors.green.shade400,
        Colors.green.shade800,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      pi,
      pi,
      false,
      paint,
    );

    // 포인터 위치 계산
    final pointerX = size.width * value / 100;

    // 반원 위의 점 위치 계산 - 수정된 부분
    final angle = pi + (pi * value / 100);

    // 반원의 정확한 중심선 위치 계산 - 수정
    final radius = arcHeight;

    final dotX = size.width / 2 + radius * cos(angle);
    final dotY = arcHeight + radius * sin(angle);

    // 점 크기를 키워서 더 잘 보이게 함
    const dotSize = 8.0;

    // 흰색 점 그리기
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // 점 주위에 검은색 테두리 그리기 (가독성 향상)
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // 테두리와 점 그리기
    canvas.drawCircle(Offset(dotX, dotY), dotSize + 1, borderPaint);
    canvas.drawCircle(Offset(dotX, dotY), dotSize, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
