import 'package:json_annotation/json_annotation.dart';

enum AlertType {
  price,
  rsi,
  @JsonValue('kimchi_premium')
  kimchiPremium,
  dominance,
  mvrv,
  ma,
}

enum AlertDirection { above, below }

enum RsiInterval {
  min15('15m'),
  hour1('1h'),
  hour4('4h'),
  day1('1d');

  final String value;
  const RsiInterval(this.value);
}

enum MaInterval {
  ma20,
  ma60,
  ma120,
  ma200,
}

enum Currency { KRW, USD }

class AlertRequest {
  final AlertType type;
  final String symbol;
  final double threshold;
  final AlertDirection direction;
  final RsiInterval? interval;
  final MaInterval? maInterval;
  final Currency? currency;

  AlertRequest({
    required this.type,
    required this.symbol,
    required this.threshold,
    required this.direction,
    this.interval,
    this.maInterval,
    this.currency,
  });

  Map<String, dynamic> toJson() => {
        'type': type == AlertType.kimchiPremium ? 'kimchi_premium' : type.name,
        'symbol': symbol,
        'threshold': threshold,
        'direction': direction.name,
        if (interval != null) 'interval': interval!.value,
        if (maInterval != null)
          'interval':
              maInterval!.toString().split('.').last.replaceAll('ma', ''),
        if (currency != null) 'currency': currency!.name,
      };
}

class AlertResponse {
  final int id;
  final AlertType type;
  final String symbol;
  final double threshold;
  final AlertDirection direction;
  final RsiInterval? rsiInterval;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? triggeredAt;
  final Currency? currency;
  final String? maInterval;

  AlertResponse({
    required this.id,
    required this.type,
    required this.symbol,
    required this.threshold,
    required this.direction,
    String? interval,
    required this.isActive,
    required this.createdAt,
    this.triggeredAt,
    this.currency,
  })  : rsiInterval =
            type == AlertType.rsi ? _parseRsiInterval(interval) : null,
        maInterval = type == AlertType.ma ? interval : null;

  factory AlertResponse.fromJson(Map<String, dynamic> json) {
    return AlertResponse(
      id: json['id'],
      type: _parseAlertType(json['type']),
      symbol: json['symbol'],
      threshold: json['threshold'].toDouble(),
      direction: AlertDirection.values.byName(json['direction']),
      interval: json['interval'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      triggeredAt: json['triggered_at'] != null
          ? DateTime.parse(json['triggered_at'])
          : null,
      currency: json['currency'] != null
          ? Currency.values.byName(json['currency'])
          : null,
    );
  }

  static RsiInterval? _parseRsiInterval(String? interval) {
    if (interval == null) return null;
    return RsiInterval.values.firstWhere(
      (e) => e.value == interval,
      orElse: () =>
          throw FormatException('Unknown RSI interval format: $interval'),
    );
  }

  static AlertType _parseAlertType(String type) {
    if (type == 'kimchi_premium') {
      return AlertType.kimchiPremium;
    }
    return AlertType.values.byName(type);
  }
}

class AlertToggleResponse {
  final int id;
  final bool isActive;
  final String message;

  AlertToggleResponse({
    required this.id,
    required this.isActive,
    required this.message,
  });

  factory AlertToggleResponse.fromJson(Map<String, dynamic> json) {
    return AlertToggleResponse(
      id: json['id'],
      isActive: json['is_active'],
      message: json['message'],
    );
  }
}
