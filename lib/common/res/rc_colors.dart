import 'package:flutter/material.dart';

///To get the colors according to the theme
extension RCColors on BuildContext {
  /// Boolean to check whether the theme is light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Function to get the colours according to the theme
  Color color(
    RCColorDetail lightDarkColor, {
    bool defaultColor = false,
  }) =>
      defaultColor
          ? lightDarkColor.any
          : isLightMode
              ? lightDarkColor.light ?? lightDarkColor.any
              : lightDarkColor.dark ?? lightDarkColor.any;
}

///To get color of overall app
class RCColorDetail {
  ///Color which is set as a default value
  final Color any;

  ///Color which is set for light mode
  final Color? light;

  ///Color which is set for dark mode
  final Color? dark;

  /// To get the colors according to the theme
  RCColorDetail({
    required this.any,
    this.light,
    this.dark,
  });
}

/// Colour variable for App Bar
RCColorDetail get cvAppBar => RCColorDetail(
      any: const Color(0xFFFAFAFA),
      light: const Color(0xFFFAFAFA),
      dark: const Color(0xFF172833),
    );

/// Colour variable for App Bar Text
RCColorDetail get cvAppBarText => RCColorDetail(
      any: const Color(0xFF172833),
      light: const Color(0xFF172833),
      dark: const Color(0xFFFAFAFA),
    );
