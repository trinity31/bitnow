enum AlertType { price, rsi, kimchiPremium, dominance, mvrv }

enum AlertDirection { above, below }

enum RsiInterval { min15, hour1, hour4, day1 }

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
        'type': type.name,
        'symbol': symbol,
        'threshold': threshold,
        'direction': direction.name,
        if (interval != null) 'interval': interval!.name,
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
  });

  factory AlertResponse.fromJson(Map<String, dynamic> json) {
    return AlertResponse(
      id: json['id'],
      type: AlertType.values.byName(json['type']),
      symbol: json['symbol'],
      threshold: json['threshold'].toDouble(),
      direction: AlertDirection.values.byName(json['direction']),
      interval: json['interval'] != null
          ? RsiInterval.values.byName(json['interval'])
          : null,
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      triggeredAt: json['triggered_at'] != null
          ? DateTime.parse(json['triggered_at'])
          : null,
    );
  }
}
