import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => buildTheme(
    primary: const Color(0xFFF16D5B),
    secondary: const Color(0xFFFFBD59),
    background: const Color(0xFFFFF9F1),
    surface: const Color(0xFFFFFFFF),
    text: const Color(0xFF292B35),
    secondaryText: const Color(0xFF77747B),
    border: const Color(0xFFF0E8DF),
    isDark: false,
  );

  // Additional palettes for the future theme selector.
  static ThemeData get sageTheme => buildTheme(
    primary: const Color(0xFF66816B),
    secondary: const Color(0xFFB9CBB7),
    background: const Color(0xFFF0F3EC),
    surface: const Color(0xFFFAFBF7),
    text: const Color(0xFF35483A),
    secondaryText: const Color(0xFF788778),
    border: const Color(0xFFDCE4D8),
    isDark: false,
  );

  static ThemeData get roseTheme => buildTheme(
    primary: const Color(0xFFAD7185),
    secondary: const Color(0xFFE5C3CD),
    background: const Color(0xFFF6EEF0),
    surface: const Color(0xFFFFFAFB),
    text: const Color(0xFF573E49),
    secondaryText: const Color(0xFF927783),
    border: const Color(0xFFEADCE1),
    isDark: false,
  );

  static ThemeData get blueTheme => buildTheme(
    primary: const Color(0xFF647F9D),
    secondary: const Color(0xFFBDCCDE),
    background: const Color(0xFFEDF1F7),
    surface: const Color(0xFFF9FAFD),
    text: const Color(0xFF35465C),
    secondaryText: const Color(0xFF78899D),
    border: const Color(0xFFDCE3EC),
    isDark: false,
  );

  static ThemeData get midnightTheme => buildTheme(
    primary: const Color(0xFFD0A98A),
    secondary: const Color(0xFF786779),
    background: const Color(0xFF191A20),
    surface: const Color(0xFF24252D),
    text: const Color(0xFFF1EAE2),
    secondaryText: const Color(0xFFB1A7A0),
    border: const Color(0xFF3B3C45),
    isDark: true,
  );

  static ThemeData buildTheme({
    required Color primary,
    required Color secondary,
    required Color background,
    required Color surface,
    required Color text,
    required Color secondaryText,
    required Color border,
    required bool isDark,
  }) {
    final base = isDark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    final textTheme = base.textTheme.copyWith(
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        height: 1.15,
        color: text,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: text,
      ),
      titleLarge: GoogleFonts.dmSans(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: text,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: text,
      ),
      bodyLarge: GoogleFonts.dmSans(fontSize: 15, height: 1.55, color: text),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 13,
        height: 1.5,
        color: secondaryText,
      ),
      labelLarge: GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
        color: text,
      ),
      labelMedium: GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.1,
        color: secondaryText,
      ),
    );

    final colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primary,
      onPrimary: isDark ? const Color(0xFF211B18) : Colors.white,
      secondary: secondary,
      onSecondary: text,
      error: const Color(0xFFCC6262),
      onError: Colors.white,
      surface: surface,
      onSurface: text,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.dmSans(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      iconTheme: IconThemeData(color: secondaryText),
      dividerTheme: DividerThemeData(color: border, thickness: 1, space: 1),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primary.withValues(alpha: 0.13),
        elevation: 0,
        height: 68,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.dmSans(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? primary : secondaryText,
          );
        }),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          side: BorderSide(color: border),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: GoogleFonts.dmSans(color: secondaryText, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
      ),
    );
  }
}
