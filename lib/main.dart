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
import 'package:google_mobile_ads/google_mobile_ads.dart';

// 백그라운드 메시지 핸들러
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //();
  safePrint('백그라운드 메시지 수신: ${message.messageId}');
  safePrint('백그라운드 메시지 수신: ${message.messageId}');
  safePrint('알림 제목: ${message.notification?.title}');
  safePrint('알림 내용: ${message.notification?.body}');
  safePrint('알림 데이터: ${message.data}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  if (Platform.isAndroid || Platform.isIOS) {
    try {
      // 테스트 디바이스 ID 등록
      MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(
          testDeviceIds: ['18aea38bb112d1ba870703ef5672c7d3', '71694CD35869E1D1AA27879358C4E46C'],
        ),
      );

      // 광고 초기화
      await MobileAds.instance.initialize();
      safePrint('AdMob 초기화 성공');
    } catch (e) {
      safePrint('AdMob 초기화 실패: $e');
    }
  }

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

  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    safePrint('User granted permission');
    // String? apnsToken = await messaging.getAPNSToken();
    // String? fcmToken = await messaging.getToken();
    // safePrint("FCM Token: $fcmToken");
  } else {
    safePrint('User declined or has not accepted permission');
  }

  String? fcmToken;
  if (Platform.isIOS) {
    // iOS: APNs 토큰 먼저 가져오기
    try {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      safePrint('APNs Token: $apnsToken');

      // APNs 토큰을 얻은 후 FCM 토큰 요청
      if (apnsToken != null) {
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

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'default_channel_id', // 동일한 ID를 AndroidManifest.xml에 설정
    'Default Channel', // 사용자에게 표시될 채널 이름
    importance: Importance.high,
  );

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    notificationCategories: [
      DarwinNotificationCategory(
        'bitnow_alert',
        options: {
          DarwinNotificationCategoryOption.allowAnnouncement,
        },
      ),
    ],
  );
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

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
