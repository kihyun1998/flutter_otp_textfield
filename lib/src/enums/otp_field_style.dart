/// Defines the visual style of OTP input fields.
///
/// The field style determines how the input fields are visually presented.
/// Each style provides a different aesthetic while maintaining the same
/// functionality.
///
/// Example usage:
/// ```dart
/// OTPTextField(
///   fieldStyle: OTPFieldStyle.underline,
///   controllers: controllers,
///   focusNodes: focusNodes,
///   textStyle: TextStyle(fontSize: 24),
/// )
/// ```
///
/// See also:
/// - [OTPTextField.fieldStyle] for using this in the widget
/// - [OTPTheme] for customizing the appearance of each style
enum OTPFieldStyle {
  /// Box-shaped field with borders on all four sides.
  ///
  /// This is the default and most common style. Fields appear as boxes
  /// with customizable border radius via [OTPTheme.borderRadius].
  ///
  /// Best for:
  /// - Traditional OTP input
  /// - Clear field boundaries
  /// - Material Design apps
  box,

  /// Underlined fields with border only at the bottom.
  ///
  /// Provides a minimalist appearance with less visual weight.
  /// The underline width can be customized via [OTPTheme.underlineWidth].
  ///
  /// Best for:
  /// - Clean, modern interfaces
  /// - Minimal designs
  /// - When screen space is limited
  underline,

  /// Circular fields.
  ///
  /// Creates round input fields. The border radius is automatically
  /// calculated to create perfect circles based on the field width.
  ///
  /// Best for:
  /// - PIN entry screens
  /// - Secure code input
  /// - Unique visual design
  circle,
}
