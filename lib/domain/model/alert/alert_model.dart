import 'package:json_annotation/json_annotation.dart';

enum AlertType {
  price,
  rsi,
  @JsonValue('kimchi_premium')
  kimchiPremium,
  dominance,
  mvrv
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

enum Currency { KRW, USD }

class AlertRequest {
  final AlertType type;
  final String symbol;
  final double threshold;
  final AlertDirection direction;
  final RsiInterval? interval;
  final Currency? currency;

  AlertRequest({
    required this.type,
    required this.symbol,
    required this.threshold,
    required this.direction,
    this.interval,
    this.currency,
  });

  Map<String, dynamic> toJson() => {
        'type': type == AlertType.kimchiPremium ? 'kimchi_premium' : type.name,
        'symbol': symbol,
        'threshold': threshold,
        'direction': direction.name,
        if (interval != null) 'interval': interval!.value,
        if (currency != null) 'currency': currency!.name,
      };
}

class AlertResponse {
  final int id;
  final AlertType type;
  final String symbol;
  final double threshold;
  final AlertDirection direction;
  final RsiInterval? interval;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? triggeredAt;
  final Currency? currency;

  AlertResponse({
    required this.id,
    required this.type,
    required this.symbol,
    required this.threshold,
    required this.direction,
    this.interval,
    required this.isActive,
    required this.createdAt,
    this.triggeredAt,
    this.currency,
  });

  factory AlertResponse.fromJson(Map<String, dynamic> json) {
    return AlertResponse(
      id: json['id'],
      type: _parseAlertType(json['type']),
      symbol: json['symbol'],
      threshold: json['threshold'].toDouble(),
      direction: AlertDirection.values.byName(json['direction']),
      interval:
          json['interval'] != null ? _parseInterval(json['interval']) : null,
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

  static RsiInterval _parseInterval(String interval) {
    return RsiInterval.values.firstWhere(
      (e) => e.value == interval,
      orElse: () => throw FormatException('Unknown interval format: $interval'),
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
