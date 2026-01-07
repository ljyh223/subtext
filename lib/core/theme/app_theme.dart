import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors from the design
  static const Color paperWhite = Color(0xFFF2F2F0);
  static const Color burntOrange = Color(0xFFEA580C);
  static const Color richBlack = Color(0xFF1A1A1A);
  static const Color stone600 = Color(0xFF57534E);
  static const Color stone500 = Color(0xFF78716C);
  static const Color stone400 = Color(0xFFA8A29E);
  static const Color stone300 = Color(0xFFD6D3D1);
  static const Color stone200 = Color(0xFFE7E5E4);
  static const Color stone100 = Color(0xFFF5F5F4);
  static const Color stone50 = Color(0xFFFAFAF9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color redLight = Color(0xFFFEE2E2);
  static const Color orangeLight = Color(0xFFFED7AA);
  static const Color greenLight = Color(0xFFBBF7D0);

  // ThemeData
  static ThemeData get theme {
    return ThemeData(
      primaryColor: burntOrange,
      scaffoldBackgroundColor: paperWhite,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ).copyWith(surface: paperWhite),
      textTheme: TextTheme(
        // Headings - Playfair Display
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: richBlack,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: richBlack,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: richBlack,
        ),
        // Body - Inter
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: richBlack,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: richBlack,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: richBlack,
        ),
        // Caption
        labelMedium: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: stone400,
          letterSpacing: 0.2,
        ),
        // Button
        labelSmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: white,
          letterSpacing: 0.1,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          foregroundColor: white,
          textStyle: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: richBlack,
          textStyle: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}
