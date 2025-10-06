import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color.fromARGB(255, 236, 239, 6); // 네온 핑크
  static const backgroundColor = Color(0xFF0A0E17); // 다크 네이비
  static const cardColor = Color(0xFF1A1F2C); // 약간 밝은 다크 네이비
  static const appBarColor = Color(0xFF252A34); // 세련된 다크 그레이
  static const textColor = Colors.white;
  static const secondaryTextColor = Color(0xFF8F9BB3); // 연한 회색
  static const accentColor = Color(0xFF00D1FF); // 네온 블루

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 236, 239, 6),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 236, 239, 6),
      secondary: accentColor,
      surface: backgroundColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarColor, // 앱바 색상 적용
      elevation: 0,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ),
    cardTheme: const CardThemeData(
      color: cardColor,
      elevation: 0,
    ),
  );
}
