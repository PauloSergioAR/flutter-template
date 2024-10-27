import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../infra.dart';

class UiTextStyle {
  /// [fontSize: 24, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle heading24({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.publicSans(
        fontSize: 24,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 22, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle heading22({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.publicSans(
        fontSize: 22,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 20, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle heading20({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.publicSans(
        fontSize: 20,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 18, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle bodyLarge({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.openSans(
        fontSize: 18,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 16, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle bodyMedium({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 14, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle bodySmall({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 12, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle bodyXSmall({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.openSans(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );

  /// [fontSize: 10, FontWeight.w500, UiColors.fontColor, letterSpacing: 0]
  static TextStyle bodyCaption({
    Color color = UiColors.fontColor,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.openSans(
        fontSize: 10,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );
}
