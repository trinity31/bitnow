import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_screen.dart';
import '../../viewmodel/auth_view_model.dart';
import '../../viewmodel/alert_view_model.dart';
import '../../../domain/model/alert/alert_model.dart';
import '../../../core/exceptions.dart';
import 'package:intl/intl.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends ConsumerState<NotificationSettingsScreen> {
  AlertType _selectedType = AlertType.price;
  final _thresholdController = TextEditingController();
  AlertDirection _direction = AlertDirection.above;
  RsiInterval? _interval;
  bool _isExpanded = false;
  Currency _currency = Currency.KRW;

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    return authState.when(
      data: (token) {
        if (token == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('알림 설정'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '알림을 설정하려면 로그인이 필요합니다',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 20,
                      ),
                      minimumSize: const Size(200, 60),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      ).then((_) {
                        ref.refresh(authViewModelProvider);
                      });
                    },
                    child: const Text(
                      '로그인하기',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final alertsState = ref.watch(alertViewModelProvider);

        return Scaffold(
          appBar: AppBar(
            title: const Text('알림 설정'),
          ),
          body: Column(
            children: [
              ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (index, isExpanded) {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.transparent,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        leading: Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          '새 알림 추가',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    },
                    isExpanded: _isExpanded,
                    body: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          DropdownButtonFormField<AlertType>(
                            value: _selectedType,
                            decoration: const InputDecoration(
                              labelText: '알림 유형',
                              border: OutlineInputBorder(),
                            ),
                            items: AlertType.values.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(_getAlertTypeText(type)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value!;
                                if (value != AlertType.rsi) {
                                  _interval = null;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          if (_selectedType == AlertType.rsi)
                            DropdownButtonFormField<RsiInterval>(
                              value: _interval ?? RsiInterval.min15,
                              decoration: const InputDecoration(
                                labelText: 'RSI 간격',
                                border: OutlineInputBorder(),
                              ),
                              items: RsiInterval.values.map((interval) {
                                return DropdownMenuItem(
                                  value: interval,
                                  child: Text(_getRsiIntervalText(interval)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _interval = value;
                                });
                              },
                            ),
                          if (_selectedType == AlertType.price) ...[
                            DropdownButtonFormField<Currency>(
                              value: _currency,
                              decoration: const InputDecoration(
                                labelText: '통화',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: Currency.KRW,
                                  child: Text('원화 (KRW)'),
                                ),
                                DropdownMenuItem(
                                  value: Currency.USD,
                                  child: Text('달러 (USD)'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _currency = value!;
                                });
                              },
                            ),
                          ],
                          const SizedBox(height: 16),
                          TextField(
                            controller: _thresholdController,
                            decoration: InputDecoration(
                              labelText: '임계값',
                              border: const OutlineInputBorder(),
                              hintText: _getThresholdHint(_selectedType),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text('방향:'),
                              Radio<AlertDirection>(
                                value: AlertDirection.above,
                                groupValue: _direction,
                                onChanged: (value) {
                                  setState(() {
                                    _direction = value!;
                                  });
                                },
                              ),
                              const Text('이상'),
                              Radio<AlertDirection>(
                                value: AlertDirection.below,
                                groupValue: _direction,
                                onChanged: (value) {
                                  setState(() {
                                    _direction = value!;
                                  });
                                },
                              ),
                              const Text('이하'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () async {
                                FocusScope.of(context).unfocus();

                                try {
                                  final threshold = double.tryParse(
                                      _thresholdController.text);
                                  if (threshold == null) {
                                    throw AlertException('올바른 임계값을 입력해주세요');
                                  }

                                  await ref
                                      .read(alertViewModelProvider.notifier)
                                      .createAlert(
                                        AlertRequest(
                                          type: _selectedType,
                                          symbol: 'BTC',
                                          threshold: threshold,
                                          direction: _direction,
                                          interval:
                                              _selectedType == AlertType.rsi
                                                  ? _interval
                                                  : null,
                                          currency:
                                              _selectedType == AlertType.price
                                                  ? _currency
                                                  : null,
                                        ),
                                      );

                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('알림이 설정되었습니다')),
                                    );
                                    _thresholdController.clear();
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e
                                              .toString()
                                              .replaceAll('Exception: ', ''),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text('알림 설정'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              Expanded(
                child: alertsState.when(
                  data: (alerts) {
                    if (alerts.isEmpty) {
                      return const Center(
                        child: Text('설정된 알림이 없습니다'),
                      );
                    }

                    return ListView.builder(
                      itemCount: alerts.length,
                      itemBuilder: (context, index) {
                        final alert = alerts[index];
                        final formattedValue = _formatAlertValue(
                          alert.type,
                          alert.threshold,
                          _selectedType == AlertType.price ? _currency : null,
                        );
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                _getAlertTypeText(alert.type),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: alert.isActive
                                      ? Colors.green.withOpacity(0.2)
                                      : Colors.orange.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  alert.isActive ? '활성' : '알림 완료',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: alert.isActive
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  formattedValue,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: alert.isActive
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    alert.direction == AlertDirection.above
                                        ? '이상'
                                        : '이하',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: alert.isActive
                                          ? Colors.white70
                                          : Colors.white30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!alert.isActive)
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.orange,
                                    side:
                                        const BorderSide(color: Colors.orange),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      await ref
                                          .read(alertViewModelProvider.notifier)
                                          .reactivateAlert(alert.id);
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('알림이 다시 활성화되었습니다'),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              e.toString().replaceAll(
                                                  'Exception: ', ''),
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text('다시 켜기'),
                                ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.grey),
                                onPressed: () async {
                                  try {
                                    await ref
                                        .read(alertViewModelProvider.notifier)
                                        .deleteAlert(alert.id);
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('알림이 삭제되었습니다')),
                                      );
                                    }
                                  } catch (e) {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text('알림 삭제 실패: $e')),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(
                    child: Text('오류가 발생했습니다: $error'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('오류가 발생했습니다: $error')),
      ),
    );
  }

  String _getAlertTypeText(AlertType type) {
    switch (type) {
      case AlertType.price:
        return '가격';
      case AlertType.rsi:
        return 'RSI';
      case AlertType.kimchiPremium:
        return '김치프리미엄';
      case AlertType.dominance:
        return '도미넌스';
      case AlertType.mvrv:
        return 'MVRV';
    }
  }

  String _getRsiIntervalText(RsiInterval interval) {
    switch (interval) {
      case RsiInterval.min15:
        return '15분';
      case RsiInterval.hour1:
        return '1시간';
      case RsiInterval.hour4:
        return '4시간';
      case RsiInterval.day1:
        return '1일';
    }
  }

  String _getThresholdHint(AlertType type) {
    switch (type) {
      case AlertType.price:
        return _currency == Currency.KRW
            ? '원화 가격 (예: 30000000)'
            : '달러 가격 (예: 20000)';
      case AlertType.rsi:
        return 'RSI 값 (0-100)';
      case AlertType.kimchiPremium:
        return '프리미엄 % (예: 5.0)';
      case AlertType.dominance:
        return '도미넌스 % (예: 50.0)';
      case AlertType.mvrv:
        return 'MVRV 비율 (예: 3.0)';
    }
  }

  String _formatAlertValue(AlertType type, double value, Currency? currency) {
    switch (type) {
      case AlertType.price:
        final formatter = NumberFormat('#,###');
        return currency == Currency.KRW
            ? '₩${formatter.format(value)}'
            : '\$${formatter.format(value)}';
      case AlertType.rsi:
        return value.toStringAsFixed(0);
      case AlertType.kimchiPremium:
      case AlertType.dominance:
        return '${value.toStringAsFixed(1)}%';
      case AlertType.mvrv:
        return value.toStringAsFixed(1);
    }
  }
}
