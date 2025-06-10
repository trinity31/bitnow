import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/print.dart';

class AuthUtils {
  // JWT 토큰이 만료되었는지 확인
  static bool isTokenExpired(String? token) {
    if (token == null || token.isEmpty) return true;
    
    try {
      // JWT는 .으로 구분된 3부분으로 구성됨 (헤더.페이로드.서명)
      final parts = token.split('.');
      if (parts.length != 3) {
        safePrint('❌ 유효하지 않은 JWT 토큰 형식');
        return true;
      }
      
      // Base64Url 디코딩 (패딩 추가 필요)
      var payload = parts[1];
      payload = payload.padRight(payload.length + (4 - payload.length % 4) % 4, '=');
      
      // JSON 파싱
      final payloadJson = json.decode(utf8.decode(base64Url.decode(payload)));
      final exp = payloadJson['exp'] as int?;
      
      if (exp == null) {
        safePrint('❌ 토큰에 만료 시간(exp)이 없습니다.');
        return true;
      }
      
      // 현재 시간(초)과 토큰 만료 시간 비교
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final isExpired = currentTime >= exp;
      
      if (isExpired) {
        safePrint('🔐 토큰이 만료되었습니다. (만료시간: ${DateTime.fromMillisecondsSinceEpoch(exp * 1000)})');
      } else {
        final remaining = Duration(seconds: exp - currentTime);
        safePrint('🔑 토큰이 유효합니다. (남은 시간: ${remaining.inMinutes}분 ${remaining.inSeconds % 60}초)');
      }
      
      return isExpired;
    } catch (e) {
      safePrint('❌ 토큰 검증 중 오류 발생: $e');
      return true; // 오류 발생 시 안전을 위해 만료된 것으로 처리
    }
  }
  
  // SharedPreferences에서 토큰 가져와서 만료 여부 확인
  static Future<bool> isCurrentTokenExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return isTokenExpired(token);
  }
}
