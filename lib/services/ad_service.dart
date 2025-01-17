import 'dart:async';
import 'dart:io';
import 'package:btc_price_app/utils/print.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'ad_service.g.dart';

@Riverpod(keepAlive: true)
class AdService extends _$AdService {
  RewardedAd? _rewardedAd;
  bool _isLoading = false;
  int _retryAttempt = 0;
  static const int maxRetries = 3;

  String get _adUnitId {
    if (kDebugMode) {
      safePrint('테스트 모드');
      return dotenv.env['ADMOB_REWARDED_AD_UNIT_ID_TEST'] ?? '';
    }
    if (Platform.isAndroid) {
      safePrint('안드로이드 모드');
      return dotenv.env['ADMOB_REWARDED_AD_UNIT_ID_ANDROID'] ?? '';
    }
    if (Platform.isIOS) {
      safePrint('IOS 모드');
      return dotenv.env['ADMOB_REWARDED_AD_UNIT_ID_IOS'] ?? '';
    }

    throw Exception('지원하지 않는 플랫폼입니다');
  }

  @override
  AdService build() => this;

  Future<void> loadRewardedAd() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final completer = Completer<void>();

      await RewardedAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            safePrint('광고 로드 성공');
            _rewardedAd = ad;
            _isLoading = false;
            _retryAttempt = 0;
            completer.complete();
          },
          onAdFailedToLoad: (error) {
            _isLoading = false;
            safePrint(
                '광고 로드 실패: ${error.message} (시도: ${_retryAttempt + 1}/$maxRetries)');
              
            // Crashlytics Non-fatal error 기록
            FirebaseCrashlytics.instance.recordError(
              Exception(
                  '광고 로드 실패: ${error.message} (시도: ${_retryAttempt + 1}/$maxRetries)'),
              null, // stackTrace가 있다면 함께 전달
              reason: 'AdMob load failed',
              fatal: false, // 비치명적 에러
            );

            if (_retryAttempt < maxRetries) {
              _retryAttempt++;
              Future.delayed(Duration(seconds: _retryAttempt), loadRewardedAd);
              completer.complete();
            } else {
              _retryAttempt = 0;
              completer.completeError(Exception('광고 로드 실패: ${error.message}'));
            }
          },
        ),
      );

      await completer.future;
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  Future<bool> showRewardedAd() async {
    final completer = Completer<bool>();

    if (_rewardedAd == null) {
      safePrint('광고 객체가 없어서 새로 로드합니다.');
      try {
        await loadRewardedAd();
      } catch (e) {
        safePrint('광고 로드 중 에러: $e');
        return false;
      }
    }

    if (_rewardedAd == null) {
      safePrint('광고 로드 실패');
      return false;
    }

    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        safePrint('전체화면 광고가 표시됨');
      },
      onAdDismissedFullScreenContent: (ad) {
        safePrint('사용자가 광고를 닫음');
        ad.dispose();
        _rewardedAd = null;
        completer.complete(false);
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        safePrint('광고 표시 실패: ${error.message}');
        ad.dispose();
        _rewardedAd = null;
        completer.completeError(Exception('광고 표시 실패: ${error.message}'));
      },
      onAdImpression: (ad) {
        safePrint('광고 노출이 기록됨');
      },
    );

    safePrint('광고 표시 시도...');
    await _rewardedAd?.setImmersiveMode(true);

    _rewardedAd?.show(
      onUserEarnedReward: (_, reward) {
        safePrint('사용자가 보상을 받음: ${reward.amount} ${reward.type}');
        completer.complete(true);
      },
    );

    return completer.future;
  }
}
