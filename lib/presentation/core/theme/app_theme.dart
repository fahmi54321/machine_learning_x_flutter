import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

// ========================
// COLOR SYSTEM DOCUMENTATION
// ========================
//
// primary → main action color (buttons, active state)
// onPrimary → text/icon on primary
//
// surface → background of cards, dialog, input
// onSurface → main text color
//
// background → scaffold background
// canvasColor → material surfaces (dropdown popup, drawer)
//
// outline → borders, divider
//
// error → validation error color
//

class AppTheme {
  ThemeData buildDark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
      outline: Colors.white24,
      surface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      canvasColor: Color(0xff243B55),

      // ========================
      // TYPOGRAPHY
      // ========================
      textTheme:
          TextTheme(
            displayLarge: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: const TextStyle(fontSize: 16),
            bodyMedium: const TextStyle(fontSize: 14),
            bodySmall: const TextStyle(fontSize: 12),
          ).apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface,
          ),

      // ========================
      // INPUT FIELD
      // ========================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        hintStyle: TextStyle(
          color: colorScheme.onSurface.withValues(alpha: 0.6),
          fontSize: 12.0,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),

      // ========================
      // DROPDOWN
      // ========================
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: colorScheme.onSurface),
      ),

      // ========================
      // DIALOG
      // ========================
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      // ========================
      // SNACKBAR
      // ========================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,
        contentTextStyle: TextStyle(color: colorScheme.onSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // ========================
      // GLASS EXTENSION
      // ========================
      extensions: const [
        AppGlassTheme(
          blur: 20,
          radius: 30,
          backgroundAlpha: 0.08,
          borderAlpha: 0.15,
          glowAlpha: 0.25,
          shadowAlpha: 0.3,
          sigmaX: 16,
          sigmaY: 16,
          primaryGradient: LinearGradient(
            colors: [Color(0xff00c6ff), Color(0xff0072ff)],
          ),
          backgroundGradient: const LinearGradient(
            colors: [Color(0xff141E30), Color(0xff243B55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          riskLowColor: Color(0xFF00E676),
          riskMediumColor: Color(0xFFFFA726),
          riskHighColor: Color(0xFFFF5252),
          descriptionTextColor: Colors.white70,
        ),
      ],
    );
  }
}
