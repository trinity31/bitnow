import 'package:flutter/material.dart';
import 'package:btc_price_app/core/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: const Text('알림'),
      ),
      body: const Center(
        child: Text('알림 목록 - 준비 중'),
      ),
    );
  }
}
