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
  final double imageAlpha;
  final double borderAlpha;
  final double glowAlpha;
  final double shadowAlpha;
  final Gradient primaryGradient;
  final Gradient secondaryGradient;
  final Gradient otherGradient;
  final Gradient bgImageGradient;
  final Color riskLowColor;
  final Color riskMediumColor;
  final Color riskHighColor;
  final Color descriptionTextColor;
  final Color classificationTextColor;
  final Color badResultColor;
  final Color goodResultColor;
  final Color white38Color;
  final Color white54Color;
  final Color bgImageColor;
  final Color transparentColor;

  const AppGlassTheme({
    required this.blur,
    required this.sigmaX,
    required this.sigmaY,
    required this.radius,
    required this.backgroundAlpha,
    required this.imageAlpha,
    required this.borderAlpha,
    required this.glowAlpha,
    required this.shadowAlpha,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.otherGradient,
    required this.bgImageGradient,
    required this.riskLowColor,
    required this.riskMediumColor,
    required this.riskHighColor,
    required this.descriptionTextColor,
    required this.classificationTextColor,
    required this.badResultColor,
    required this.goodResultColor,
    required this.white38Color,
    required this.white54Color,
    required this.bgImageColor,
    required this.transparentColor,
  });

  @override
  AppGlassTheme copyWith({
    double? blur,
    double? sigmaX,
    double? sigmaY,
    double? radius,
    double? backgroundAlpha,
    double? imageAlpha,
    double? borderAlpha,
    double? glowAlpha,
    double? shadowAlpha,
    Gradient? primaryGradient,
    Gradient? secondaryGradient,
    Gradient? otherGradient,
    Gradient? bgImageGradient,
    Color? riskLowColor,
    Color? riskMediumColor,
    Color? riskHighColor,
    Color? descriptionTextColor,
    Color? classificationTextColor,
    Color? badResultColor,
    Color? goodResultColor,
    Color? white38Color,
    Color? white54Color,
    Color? bgImageColor,
    Color? transparentColor,
  }) {
    return AppGlassTheme(
      blur: blur ?? this.blur,
      sigmaX: sigmaX ?? this.sigmaX,
      sigmaY: sigmaY ?? this.sigmaY,
      radius: radius ?? this.radius,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      imageAlpha: imageAlpha ?? this.imageAlpha,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      glowAlpha: glowAlpha ?? this.glowAlpha,
      shadowAlpha: shadowAlpha ?? this.shadowAlpha,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      otherGradient: otherGradient ?? this.otherGradient,
      bgImageGradient: bgImageGradient ?? this.bgImageGradient,
      riskLowColor: riskLowColor ?? this.riskLowColor,
      riskMediumColor: riskMediumColor ?? this.riskMediumColor,
      riskHighColor: riskHighColor ?? this.riskHighColor,
      descriptionTextColor: descriptionTextColor ?? this.descriptionTextColor,
      classificationTextColor:
          classificationTextColor ?? this.classificationTextColor,
      badResultColor: badResultColor ?? this.badResultColor,
      goodResultColor: goodResultColor ?? this.goodResultColor,
      white38Color: white38Color ?? this.white38Color,
      white54Color: white54Color ?? this.white54Color,
      bgImageColor: bgImageColor ?? this.bgImageColor,
      transparentColor: transparentColor ?? this.transparentColor,
    );
  }

  @override
  AppGlassTheme lerp(ThemeExtension<AppGlassTheme>? other, double t) {
    if (other is! AppGlassTheme) return this;

    return AppGlassTheme(
      blur: lerpDouble(blur, other.blur, t)!,
      radius: lerpDouble(radius, other.radius, t)!,
      backgroundAlpha: lerpDouble(backgroundAlpha, other.backgroundAlpha, t)!,
      imageAlpha: lerpDouble(imageAlpha, other.imageAlpha, t)!,
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
      classificationTextColor: Color.lerp(
        classificationTextColor,
        other.classificationTextColor,
        t,
      )!,
      goodResultColor: Color.lerp(goodResultColor, other.goodResultColor, t)!,
      badResultColor: Color.lerp(badResultColor, other.badResultColor, t)!,
      white38Color: Color.lerp(white38Color, other.white38Color, t)!,
      white54Color: Color.lerp(white54Color, other.white54Color, t)!,
      bgImageColor: Color.lerp(bgImageColor, other.bgImageColor, t)!,
      transparentColor: Color.lerp(
        transparentColor,
        other.transparentColor,
        t,
      )!,
      secondaryGradient: Gradient.lerp(
        secondaryGradient,
        other.secondaryGradient,
        t,
      )!,
      otherGradient: Gradient.lerp(otherGradient, other.otherGradient, t)!,
      bgImageGradient: Gradient.lerp(
        bgImageGradient,
        other.bgImageGradient,
        t,
      )!,
    );
  }
}
