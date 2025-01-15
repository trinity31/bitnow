import 'package:btc_price_app/l10n/app_localizations.dart';
import 'package:btc_price_app/presentation/view/notification/notification_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/auth_view_model.dart';
import '../../view/account/account_screen.dart';
import '../../view/admin/admin_page.dart';
import '../../view/credit/credit_earn_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final isAdmin = ref.read(authViewModelProvider.notifier).isAdmin;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings')),
      ),
      body: ListView(
        children: [
          if (authState.value?.fcmToken != null)
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(localizations.translate('my_account')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountScreen(),
                  ),
                );
              },
            ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(localizations.translate('notification_settings')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.copyright),
            title: Text(localizations.translate('credit_earn')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreditEarnScreen(),
                ),
              );
            },
          ),
          if (isAdmin)
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: Text(localizations.translate('admin_settings')),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminPage(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
