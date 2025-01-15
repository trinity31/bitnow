import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/auth_view_model.dart';
import 'package:btc_price_app/l10n/app_localizations.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.translate('my_account'),
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: authState.when(
        data: (token) {
          if (token == null) {
            return Center(
              child: Text(localizations.translate('login_required')),
            );
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  localizations.translate('account_settings'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<String?>(
                future: ref.read(authViewModelProvider.notifier).getUserEmail(),
                builder: (context, snapshot) {
                  return ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(snapshot.data ??
                        localizations.translate('email_not_found')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(localizations.translate('logout')),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(localizations.translate('logout_title')),
                      content: Text(localizations.translate('logout_message')),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(localizations.translate('cancel')),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(localizations.translate('logout')),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    await ref.read(authViewModelProvider.notifier).logout();
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: Text(
                  localizations.translate('delete_account'),
                  style: const TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:
                          Text(localizations.translate('delete_account_title')),
                      content: Text(
                          localizations.translate('delete_account_message')),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(localizations.translate('cancel')),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child:
                              Text(localizations.translate('delete_account')),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    try {
                      await ref
                          .read(authViewModelProvider.notifier)
                          .deleteAccount();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                localizations.translate('account_deleted')),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${localizations.translate('account_delete_failed')}${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  }
                },
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child:
              Text('${localizations.translate('error_occurred_with')}$error'),
        ),
      ),
    );
  }
}
