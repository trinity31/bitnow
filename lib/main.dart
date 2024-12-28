import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btc_price_app/presentation/view/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:btc_price_app/core/theme.dart';
import 'presentation/view/settings/settings_screen.dart';
import 'presentation/viewmodel/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Mock FCM 토큰
  const mockFcmToken = 'mock_fcm_token_for_testing';

  runApp(
    const ProviderScope(
      child: MyApp(initialFcmToken: mockFcmToken),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final String? initialFcmToken;

  const MyApp({super.key, this.initialFcmToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialFcmToken != null) {
      ref.read(authViewModelProvider.notifier).updateFcmToken(initialFcmToken!);
    }

    return MaterialApp(
      title: 'BTC Price App',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
