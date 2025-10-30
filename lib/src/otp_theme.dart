import 'package:flutter/material.dart';

/// Theme configuration for OTP text field
class OTPTheme {
  /// Border color for inactive fields
  final Color borderColor;

  /// Border color for focused field
  final Color focusedBorderColor;

  /// Border color for error state
  final Color? errorBorderColor;

  /// Border width for error state
  final double errorBorderWidth;

  /// Background color for fields
  final Color? fillColor;

  /// Border color for disabled fields
  final Color? disabledBorderColor;

  /// Background color for disabled fields
  final Color? disabledFillColor;

  /// Border width for inactive fields
  final double borderWidth;

  /// Border width for focused field
  final double focusedBorderWidth;

  /// Border radius for field boxes
  final BorderRadius borderRadius;

  /// Underline width (used for underline style)
  final double underlineWidth;

  /// Whether to show cursor
  final bool showCursor;

  /// Cursor color
  final Color? cursorColor;

  /// Cursor height
  final double? cursorHeight;

  /// Cursor width
  final double cursorWidth;

  const OTPTheme({
    required this.borderColor,
    required this.focusedBorderColor,
    this.errorBorderColor,
    this.errorBorderWidth = 2.0,
    this.fillColor,
    this.disabledBorderColor,
    this.disabledFillColor,
    this.borderWidth = 1.5,
    this.focusedBorderWidth = 2.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.underlineWidth = 2.0,
    this.showCursor = true,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
  });

  /// Light theme preset
  static OTPTheme light({
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? fillColor,
    Color? disabledBorderColor,
    Color? disabledFillColor,
  }) {
    return OTPTheme(
      borderColor: borderColor ?? Colors.grey.shade400,
      focusedBorderColor: focusedBorderColor ?? Colors.blue,
      errorBorderColor: errorBorderColor ?? Colors.red,
      fillColor: fillColor ?? Colors.white,
      disabledBorderColor: disabledBorderColor ?? Colors.grey.shade300,
      disabledFillColor: disabledFillColor ?? Colors.grey.shade100,
    );
  }

  /// Dark theme preset
  static OTPTheme dark({
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? fillColor,
    Color? disabledBorderColor,
    Color? disabledFillColor,
  }) {
    return OTPTheme(
      borderColor: borderColor ?? Colors.grey.shade700,
      focusedBorderColor: focusedBorderColor ?? Colors.blueAccent,
      errorBorderColor: errorBorderColor ?? Colors.redAccent,
      fillColor: fillColor ?? Colors.grey.shade900,
      disabledBorderColor: disabledBorderColor ?? Colors.grey.shade800,
      disabledFillColor: disabledFillColor ?? Colors.grey.shade800,
    );
  }

  /// Create a custom theme
  static OTPTheme custom({
    required Color borderColor,
    required Color focusedBorderColor,
    Color? errorBorderColor,
    double errorBorderWidth = 2.0,
    Color? fillColor,
    Color? disabledBorderColor,
    Color? disabledFillColor,
    double borderWidth = 1.5,
    double focusedBorderWidth = 2.0,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    double underlineWidth = 2.0,
    bool showCursor = true,
    Color? cursorColor,
    double? cursorHeight,
    double cursorWidth = 2.0,
  }) {
    return OTPTheme(
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      errorBorderWidth: errorBorderWidth,
      fillColor: fillColor,
      disabledBorderColor: disabledBorderColor,
      disabledFillColor: disabledFillColor,
      borderWidth: borderWidth,
      focusedBorderWidth: focusedBorderWidth,
      borderRadius: borderRadius,
      underlineWidth: underlineWidth,
      showCursor: showCursor,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      cursorWidth: cursorWidth,
    );
  }

  /// Copy with method for creating modified themes
  OTPTheme copyWith({
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? errorBorderWidth,
    Color? fillColor,
    Color? disabledBorderColor,
    Color? disabledFillColor,
    double? borderWidth,
    double? focusedBorderWidth,
    BorderRadius? borderRadius,
    double? underlineWidth,
    bool? showCursor,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
  }) {
    return OTPTheme(
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorBorderWidth: errorBorderWidth ?? this.errorBorderWidth,
      fillColor: fillColor ?? this.fillColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      disabledFillColor: disabledFillColor ?? this.disabledFillColor,
      borderWidth: borderWidth ?? this.borderWidth,
      focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      underlineWidth: underlineWidth ?? this.underlineWidth,
      showCursor: showCursor ?? this.showCursor,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
    );
  }
}
