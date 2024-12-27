import 'package:flutter/material.dart';
import 'package:btc_price_app/core/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: const Text('설정'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('알림 설정'),
            trailing: Icon(Icons.chevron_right),
          ),
          // 추후 다른 설정 항목 추가
        ],
      ),
    );
  }
}
