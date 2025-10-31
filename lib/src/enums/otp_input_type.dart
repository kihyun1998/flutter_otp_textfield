/// Defines the type of characters allowed in OTP input fields.
///
/// This determines which characters the user can enter and what keyboard
/// is shown. Input formatters are automatically applied based on this type.
///
/// Example usage:
/// ```dart
/// OTPTextField(
///   inputType: OTPInputType.text,
///   textCapitalization: TextCapitalization.characters,
///   controllers: controllers,
///   focusNodes: focusNodes,
///   textStyle: TextStyle(fontSize: 24),
/// )
/// ```
///
/// See also:
/// - [OTPTextField.inputType] for using this in the widget
/// - [OTPTextField.keyboardType] for overriding the keyboard
/// - [OTPTextField.textCapitalization] for text formatting
enum OTPInputType {
  /// Only numeric digits (0-9) are allowed.
  ///
  /// This is the default and most common type for OTP codes.
  /// Automatically shows the numeric keyboard on mobile devices.
  ///
  /// Example:
  /// ```dart
  /// OTPTextField(
  ///   inputType: OTPInputType.number, // Default
  /// )
  /// // User can only enter: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
  /// ```
  ///
  /// Best for:
  /// - SMS OTP codes
  /// - Numeric PINs
  /// - Two-factor authentication codes
  number,

  /// Only alphabetic characters (a-z, A-Z) are allowed.
  ///
  /// Numbers and special characters are blocked. Useful for letter-based
  /// codes or when you want text-only input.
  ///
  /// Example:
  /// ```dart
  /// OTPTextField(
  ///   inputType: OTPInputType.text,
  ///   textCapitalization: TextCapitalization.characters,
  /// )
  /// // User can only enter: a-z, A-Z
  /// ```
  ///
  /// Tip: Combine with [TextCapitalization.characters] to auto-uppercase.
  ///
  /// Best for:
  /// - Letter-based verification codes
  /// - Custom authentication schemes
  /// - Game codes with letters only
  text,

  /// Both numeric digits and alphabetic characters are allowed.
  ///
  /// Accepts alphanumeric input (0-9, a-z, A-Z). Special characters
  /// are still blocked.
  ///
  /// Example:
  /// ```dart
  /// OTPTextField(
  ///   inputType: OTPInputType.any,
  ///   textCapitalization: TextCapitalization.characters,
  /// )
  /// // User can enter: 0-9, a-z, A-Z
  /// ```
  ///
  /// Best for:
  /// - Mixed alphanumeric codes
  /// - Promotional codes
  /// - License keys
  any,
}
