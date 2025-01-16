import 'package:btc_price_app/presentation/viewmodel/credit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_screen.dart';
import '../../viewmodel/auth_view_model.dart';
import '../../viewmodel/alert_view_model.dart';
import '../../../domain/model/alert/alert_model.dart';
import '../../../core/exceptions.dart';
import 'package:intl/intl.dart';
import '../credit/credit_earn_screen.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';
import 'package:dio/dio.dart' show DioException;

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
  late Currency _currency;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _currency = Localizations.localeOf(context).languageCode == 'ko'
          ? Currency.KRW
          : Currency.USD;
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final authState = ref.watch(authViewModelProvider);

    return authState.when(
      data: (token) {
        if (token == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.translate('notification_settings')),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.translate('login_required'),
                    style: const TextStyle(
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
                          builder: (context) => const AuthScreen(
                            source: 'notification',
                          ),
                        ),
                      ).then((_) {
                        ref.refresh(authViewModelProvider);
                      });
                    },
                    child: Text(
                      localizations.translate('login'),
                      style: const TextStyle(
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
            title: Text(localizations.translate('notification_settings')),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ref.watch(creditViewModelProvider).when(
                        data: (credit) => Row(
                          children: [
                            const Icon(
                              Icons.copyright,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${credit.balance}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        loading: () => const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        error: (_, __) => const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                      ),
                ),
              ),
            ],
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
                          localizations.translate('add_new_alert'),
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
                            decoration: InputDecoration(
                              labelText: localizations.translate('alert_type'),
                              border: const OutlineInputBorder(),
                            ),
                            items: AlertType.values
                                .where((type) =>
                                    type != AlertType.kimchiPremium ||
                                    Localizations.localeOf(context)
                                            .languageCode ==
                                        'ko')
                                .map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(localizations
                                    .translate(_getAlertTypeKey(type))),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value!;
                                if (value == AlertType.rsi) {
                                  _interval = RsiInterval.min15;
                                } else {
                                  _interval = null;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          if (_selectedType == AlertType.rsi)
                            DropdownButtonFormField<RsiInterval>(
                              value: _interval ?? RsiInterval.min15,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.translate('rsi_interval'),
                                border: const OutlineInputBorder(),
                              ),
                              items: RsiInterval.values.map((interval) {
                                return DropdownMenuItem(
                                  value: interval,
                                  child: Text(localizations
                                      .translate(_getRsiIntervalKey(interval))),
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
                              decoration: InputDecoration(
                                labelText: localizations.translate('currency'),
                                border: const OutlineInputBorder(),
                              ),
                              items: [
                                if (Localizations.localeOf(context)
                                        .languageCode ==
                                    'ko')
                                  DropdownMenuItem(
                                    value: Currency.KRW,
                                    child: Text(localizations
                                        .translate('krw_currency')),
                                  ),
                                DropdownMenuItem(
                                  value: Currency.USD,
                                  child: Text(
                                      localizations.translate('usd_currency')),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _currency = value!;
                                });
                              },
                            ),
                            //const SizedBox(height: 16),
                          ],
                          const SizedBox(height: 16),
                          TextField(
                            controller: _thresholdController,
                            decoration: InputDecoration(
                              labelText: localizations.translate('threshold'),
                              border: const OutlineInputBorder(),
                              hintText: localizations.translate(
                                  _getThresholdHintKey(_selectedType)),
                            ),
                            keyboardType:
                                _selectedType == AlertType.kimchiPremium ||
                                        _selectedType == AlertType.dominance ||
                                        _selectedType == AlertType.mvrv
                                    ? const TextInputType.numberWithOptions(
                                        decimal: true)
                                    : TextInputType.number,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text('${localizations.translate('direction')}:'),
                              Radio<AlertDirection>(
                                value: AlertDirection.above,
                                groupValue: _direction,
                                onChanged: (value) {
                                  setState(() => _direction = value!);
                                },
                              ),
                              Text(localizations.translate('above')),
                              Radio<AlertDirection>(
                                value: AlertDirection.below,
                                groupValue: _direction,
                                onChanged: (value) {
                                  setState(() => _direction = value!);
                                },
                              ),
                              Text(localizations.translate('below')),
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
                                    throw AlertException(localizations
                                        .translate('invalid_threshold'));
                                  }

                                  if (_selectedType == AlertType.rsi &&
                                      _interval == null) {
                                    throw AlertException(localizations
                                        .translate('select_rsi_interval'));
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

                                  ref.invalidate(creditViewModelProvider);

                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(localizations
                                            .translate('alert_set')),
                                      ),
                                    );
                                    _thresholdController.clear();
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    if (e is AlertException &&
                                        e.toString().contains('크레딧이 부족')) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(localizations.translate(
                                              'credit_insufficient_title')),
                                          content: Text(localizations.translate(
                                              'credit_insufficient_message')),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(localizations
                                                  .translate('cancel')),
                                            ),
                                            FilledButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CreditEarnScreen(),
                                                  ),
                                                );
                                              },
                                              child: Text(localizations
                                                  .translate('earn_credits')),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e
                                              .toString()
                                              .replaceAll('Exception: ', '')),
                                        ),
                                      );
                                    }
                                  }
                                }
                              },
                              child: Text(
                                localizations.translate('set_alert'),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                      return Center(
                        child: Text(localizations.translate('no_alerts')),
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
                                  alert.isActive
                                      ? localizations.translate('status_active')
                                      : localizations
                                          .translate('status_triggered'),
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
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          formattedValue,
                                          style: TextStyle(
                                            fontSize: 21.6,
                                            fontWeight: FontWeight.bold,
                                            color: alert.isActive
                                                ? Colors.white
                                                : Colors.white.withOpacity(0.5),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          alert.direction ==
                                                  AlertDirection.above
                                              ? localizations
                                                  .translate('direction_above')
                                              : localizations
                                                  .translate('direction_below'),
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
                              ),
                              if (!alert.isActive) ...[
                                const SizedBox(width: 8),
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
                                          SnackBar(
                                            content: Text(
                                                localizations.translate(
                                                    'alert_reactivated')),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(e
                                                .toString()
                                                .replaceAll('Exception: ', '')),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    localizations.translate('reactivate'),
                                  ),
                                ),
                              ],
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
                                        SnackBar(
                                          content: Text(localizations
                                              .translate('alert_deleted')),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e
                                              .toString()
                                              .replaceAll('Exception: ', '')),
                                        ),
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
                    child: Text(error.toString()),
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
        body: Center(child: Text(error.toString())),
      ),
    );
  }

  String _getAlertTypeText(AlertType type) {
    return AppLocalizations.of(context).translate(_getAlertTypeKey(type));
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
        return '${value.toStringAsFixed(2)}%';
      case AlertType.dominance:
        return '${value.toStringAsFixed(1)}%';
      case AlertType.mvrv:
        return value.toStringAsFixed(1);
    }
  }

  String _getAlertTypeKey(AlertType type) {
    switch (type) {
      case AlertType.price:
        return 'price';
      case AlertType.rsi:
        return 'rsi';
      case AlertType.kimchiPremium:
        return 'kimchi_premium';
      case AlertType.dominance:
        return 'dominance';
      case AlertType.mvrv:
        return 'mvrv';
    }
  }

  String _getRsiIntervalKey(RsiInterval interval) {
    switch (interval) {
      case RsiInterval.min15:
        return 'rsi_15m';
      case RsiInterval.hour1:
        return 'rsi_1h';
      case RsiInterval.hour4:
        return 'rsi_4h';
      case RsiInterval.day1:
        return 'rsi_1d';
    }
  }

  String _getThresholdHintKey(AlertType type) {
    switch (type) {
      case AlertType.price:
        return _currency == Currency.KRW
            ? 'price_threshold_hint_krw'
            : 'price_threshold_hint_usd';
      case AlertType.rsi:
        return 'rsi_threshold_hint';
      case AlertType.kimchiPremium:
        return 'premium_threshold_hint';
      case AlertType.dominance:
        return 'dominance_threshold_hint';
      case AlertType.mvrv:
        return 'mvrv_threshold_hint';
    }
  }
}
