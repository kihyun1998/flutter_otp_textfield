/// Defines the type of input allowed in OTP fields
enum OTPInputType {
  /// Only numeric digits (0-9) are allowed
  number,

  /// Only alphabetic characters (a-z, A-Z) are allowed
  text,

  /// Both numeric digits and alphabetic characters are allowed
  any,
}
