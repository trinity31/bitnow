import 'dart:io';
import 'package:btc_price_app/presentation/viewmodel/alert_view_model.dart';
import 'package:btc_price_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btc_price_app/presentation/view/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:btc_price_app/core/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/services.dart';

// 백그라운드 메시지 핸들러
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  safePrint('백그라운드 메시지 수신: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  try {
    // Firebase 초기화
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    safePrint('Firebase 초기화 성공');
  } catch (e) {
    safePrint('Firebase 초기화 실패: $e');
    return;
  }

  // FCM 백그라운드 핸들러 설정
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  String? fcmToken;
  if (Platform.isIOS) {
    // iOS: APNs 토큰 먼저 가져오기
    try {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      safePrint('APNs Token: $apnsToken');

      // APNs 토큰을 얻은 후 FCM 토큰 요청
      if (apnsToken != null) {
        await FirebaseMessaging.instance.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );
        fcmToken = await FirebaseMessaging.instance.getToken();
        safePrint('FCM Token: $fcmToken');
      }
    } catch (e) {
      safePrint('iOS 토큰 가져오기 실패: $e');
    }
  } else {
    // Android: 직접 FCM 토큰 요청
    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
      safePrint('FCM Token: $fcmToken');
    } catch (e) {
      safePrint('Android FCM Token 가져오기 실패: $e');
    }
  }

  // 로컬 노티피케이션 초기화
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    ProviderScope(
      child: MyApp(initialFcmToken: fcmToken),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final String? initialFcmToken;

  const MyApp({super.key, this.initialFcmToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FCM 토큰이 있으면 저장 및 업데이트 시도
    if (initialFcmToken != null) {
      ref.read(authViewModelProvider.notifier).updateFcmToken(initialFcmToken!);
    }

    // 앱이 포그라운드로 돌아올 때 알림 목록 새로고침
    FirebaseMessaging.onMessage.listen((message) {
      ref.invalidate(alertViewModelProvider);
    });

    // 앱이 백그라운드에서 포그라운드로 전환될 때 알림 목록 새로고침
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        ref.invalidate(alertViewModelProvider);
      }
      return null;
    });

    return MaterialApp(
      title: 'BTC Price App',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
