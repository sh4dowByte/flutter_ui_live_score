// lib/config/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Theme Data (Opsional)
  static ThemeData get darkTheme {
    Color primaryTextColor = const Color(0xFFFFFFFF);
    Color secondaryTextColor = const Color(0xFF65656B);

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.sourceSans3().fontFamily,
      scaffoldBackgroundColor: const Color(0xFF181829),
      primaryColor: const Color(0xFF246BFD),
      primaryColorDark: const Color(0xFFE6E7F2),
      primaryColorLight: Colors.black,
      dividerTheme: const DividerThemeData(color: Color(0xFF222232)),
      tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory, // Menonaktifkan ripple
        overlayColor: MaterialStateProperty.all(
            Colors.transparent), // Menonaktifkan hover
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF181829),
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF222232), // Warna background untuk mode gelap
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57, // Display terbesar untuk teks utama atau header besar
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          fontSize:
              45, // Display sedang, digunakan untuk header besar namun tidak dominan
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: TextStyle(
          fontSize: 36, // Display kecil, untuk sub-header atau judul penting
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 32, // Ukuran untuk headline atau judul utama
          color: secondaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 28, // Ukuran headline menengah
          color: primaryTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 24, // Ukuran headline kecil
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 22, // Ukuran besar untuk judul utama di layar
          color: secondaryTextColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18, // Ukuran sedang untuk judul atau subtitle
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 14, // Ukuran kecil untuk subtitle atau label
          color: secondaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          fontSize: 16, // Ukuran teks utama
          color: primaryTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14, // Ukuran teks sekunder
          color: primaryTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12, // Ukuran untuk teks tambahan atau catatan
          color: secondaryTextColor,
        ),
        labelLarge: TextStyle(
          fontSize:
              14, // Label besar, digunakan untuk tombol atau label penting
          color: secondaryTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 12, // Label sedang untuk UI elemen
          color: secondaryTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Label kecil, digunakan untuk indikator atau ikon
          color: secondaryTextColor,
        ),
      ),
    );
  }
}
