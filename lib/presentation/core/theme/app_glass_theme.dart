// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class AppGlassTheme extends ThemeExtension<AppGlassTheme> {
  final double blur;
  final double sigmaX;
  final double sigmaY;
  final double radius;
  final double backgroundAlpha;
  final double borderAlpha;
  final double glowAlpha;
  final double shadowAlpha;
  final Gradient primaryGradient;
  final Gradient backgroundGradient;
  final Color riskLowColor;
  final Color riskMediumColor;
  final Color riskHighColor;
  final Color descriptionTextColor;

  const AppGlassTheme({
    required this.blur,
    required this.sigmaX,
    required this.sigmaY,
    required this.radius,
    required this.backgroundAlpha,
    required this.borderAlpha,
    required this.glowAlpha,
    required this.shadowAlpha,
    required this.primaryGradient,
    required this.backgroundGradient,
    required this.riskLowColor,
    required this.riskMediumColor,
    required this.riskHighColor,
    required this.descriptionTextColor,
  });

  @override
  AppGlassTheme copyWith({
    double? blur,
    double? sigmaX,
    double? sigmaY,
    double? radius,
    double? backgroundAlpha,
    double? borderAlpha,
    double? glowAlpha,
    double? shadowAlpha,
    Gradient? primaryGradient,
    Gradient? backgroundGradient,
    Color? riskLowColor,
    Color? riskMediumColor,
    Color? riskHighColor,
    Color? descriptionTextColor,
  }) {
    return AppGlassTheme(
      blur: blur ?? this.blur,
      sigmaX: sigmaX ?? this.sigmaX,
      sigmaY: sigmaY ?? this.sigmaY,
      radius: radius ?? this.radius,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      glowAlpha: glowAlpha ?? this.glowAlpha,
      shadowAlpha: shadowAlpha ?? this.shadowAlpha,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      riskLowColor: riskLowColor ?? this.riskLowColor,
      riskMediumColor: riskMediumColor ?? this.riskMediumColor,
      riskHighColor: riskHighColor ?? this.riskHighColor,
      descriptionTextColor: descriptionTextColor ?? this.descriptionTextColor,
    );
  }

  @override
  AppGlassTheme lerp(ThemeExtension<AppGlassTheme>? other, double t) {
    if (other is! AppGlassTheme) return this;

    return AppGlassTheme(
      blur: lerpDouble(blur, other.blur, t)!,
      radius: lerpDouble(radius, other.radius, t)!,
      backgroundAlpha: lerpDouble(backgroundAlpha, other.backgroundAlpha, t)!,
      borderAlpha: lerpDouble(borderAlpha, other.borderAlpha, t)!,
      glowAlpha: lerpDouble(glowAlpha, other.glowAlpha, t)!,
      shadowAlpha: lerpDouble(shadowAlpha, other.shadowAlpha, t)!,
      sigmaX: lerpDouble(sigmaX, other.sigmaX, t)!,
      sigmaY: lerpDouble(sigmaY, other.sigmaY, t)!,
      primaryGradient: Gradient.lerp(
        primaryGradient,
        other.primaryGradient,
        t,
      )!,
      riskLowColor: Color.lerp(riskLowColor, other.riskLowColor, t)!,
      riskMediumColor: Color.lerp(riskMediumColor, other.riskMediumColor, t)!,
      riskHighColor: Color.lerp(riskHighColor, other.riskHighColor, t)!,
      descriptionTextColor: Color.lerp(
        descriptionTextColor,
        other.descriptionTextColor,
        t,
      )!,
      backgroundGradient: Gradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
    );
  }
}
