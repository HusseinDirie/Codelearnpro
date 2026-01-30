import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette
  static const Color darkTeal = Color(0xFF002B2B);
  static const Color vibrantYellow = Color(0xFFFFD700);
  static const Color accentTeal = Color(0xFF004D4D);
  static const Color softWhite = Color(0xFFE9E9E9);
  static const Color errorRed = Color(0xFFE94560);

  // Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkTeal,
      primaryColor: vibrantYellow,
      colorScheme: const ColorScheme.dark(
        primary: vibrantYellow,
        onPrimary: darkTeal,
        secondary: vibrantYellow,
        surface: accentTeal,
        onSurface: softWhite,
        error: errorRed,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          color: softWhite,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        headlineSmall: GoogleFonts.outfit(
          color: softWhite,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        bodyLarge: GoogleFonts.inter(color: softWhite, fontSize: 16),
        bodyMedium: GoogleFonts.inter(
          color: softWhite.withAlpha(204), // 0.8 * 255
          fontSize: 14,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkTeal,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          color: softWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: vibrantYellow),
      ),
      cardTheme: CardThemeData(
        color: accentTeal,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: vibrantYellow.withAlpha(25),
            width: 1,
          ), // 0.1 * 255
        ),
      ),
    );
  }
}
