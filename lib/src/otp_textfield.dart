import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'enums/otp_field_style.dart';
import 'enums/otp_input_type.dart';
import 'otp_theme.dart';
import 'styles/field_decoration_builder.dart';

class OTPTextField extends StatefulWidget {
  /// List of text controllers for each field
  final List<TextEditingController> controllers;

  /// List of focus nodes for each field
  final List<FocusNode> focusNodes;

  /// Callback when all fields are filled
  final ValueChanged<String>? onCompleted;

  /// Callback when any field value changes
  final ValueChanged<String>? onChange;

  /// Width of each field
  final double fieldWidth;

  /// Height of each field
  final double fieldHeight;

  /// Spacing between fields
  final double fieldSpacing;

  /// Extra spacing in the center (e.g., between 3rd and 4th field)
  final double? centerSpacing;

  /// Text style for the input
  final TextStyle textStyle;

  /// Theme for styling the fields
  final OTPTheme? theme;

  /// Visual style of the fields (box, underline, circle)
  final OTPFieldStyle fieldStyle;

  /// Type of input allowed (number, text, any)
  final OTPInputType inputType;

  /// Whether to obscure the text (for secure input)
  final bool obscureText;

  /// Character used for obscuring text
  final String obscuringCharacter;

  /// Whether the fields are enabled
  final bool enabled;

  /// Whether to auto-focus the first field
  final bool autoFocus;

  /// Whether to show error state
  final bool hasError;

  /// Override cursor visibility
  final bool? showCursor;

  /// Override cursor color
  final Color? cursorColor;

  /// Override cursor height
  final double? cursorHeight;

  /// Override cursor width
  final double? cursorWidth;

  /// Text capitalization mode
  final TextCapitalization textCapitalization;

  /// Override keyboard type (if null, determined by inputType)
  final TextInputType? keyboardType;

  const OTPTextField({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.textStyle,
    this.onCompleted,
    this.onChange,
    this.fieldWidth = 40,
    this.fieldHeight = 50,
    this.fieldSpacing = 8,
    this.centerSpacing,
    this.theme,
    this.fieldStyle = OTPFieldStyle.box,
    this.inputType = OTPInputType.number,
    this.obscureText = false,
    this.obscuringCharacter = '●',
    this.enabled = true,
    this.autoFocus = false,
    this.hasError = false,
    this.showCursor,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
  })  : assert(
          controllers.length == focusNodes.length,
          'Controllers and FocusNodes must have the same length',
        ),
        assert(
          obscuringCharacter.length == 1,
          'obscuringCharacter must be a single character',
        );

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late OTPTheme _theme;

  @override
  void initState() {
    super.initState();

    // Auto-focus first field if enabled
    if (widget.autoFocus && widget.controllers.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.controllers[0].text.isEmpty && widget.enabled) {
          widget.focusNodes[0].requestFocus();
        }
      });
    }

    // Add focus listeners to trigger rebuilds for decoration
    for (final focusNode in widget.focusNodes) {
      focusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    // Remove focus listeners
    for (final focusNode in widget.focusNodes) {
      focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? _getDefaultTheme();
  }

  @override
  void didUpdateWidget(OTPTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.theme != oldWidget.theme) {
      _theme = widget.theme ?? _getDefaultTheme();
    }
  }

  void _onFocusChange() {
    // Trigger rebuild when focus changes
    setState(() {});
  }

  OTPTheme _getDefaultTheme() {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? OTPTheme.dark() : OTPTheme.light();
  }

  void _onTextChanged(int index, String text) {
    // Call onChange callback whenever value changes
    if (widget.onChange != null) {
      final fullText = widget.controllers.map((c) => c.text).join();
      widget.onChange!(fullText);
    }

    // Check if all fields are filled
    final otp = widget.controllers.map((c) => c.text).join();
    final isAllFilled = otp.length == widget.controllers.length;

    if (text.isNotEmpty) {
      // If all fields are filled, call completion callback
      if (isAllFilled) {
        if (widget.onCompleted != null) {
          widget.onCompleted!(otp);
        }
        // Unfocus if it's the last field
        if (index == widget.controllers.length - 1) {
          widget.focusNodes[index].unfocus();
        }
      } else {
        // Move focus to next empty field
        if (index < widget.controllers.length - 1) {
          widget.focusNodes[index + 1].requestFocus();
        }
      }
    }
  }

  /// Get input formatters based on input type
  List<TextInputFormatter> _getInputFormatters() {
    switch (widget.inputType) {
      case OTPInputType.number:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ];
      case OTPInputType.text:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          LengthLimitingTextInputFormatter(1),
        ];
      case OTPInputType.any:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
          LengthLimitingTextInputFormatter(1),
        ];
    }
  }

  /// Get keyboard type based on input type or override
  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }

    switch (widget.inputType) {
      case OTPInputType.number:
        return TextInputType.number;
      case OTPInputType.text:
      case OTPInputType.any:
        return TextInputType.text;
    }
  }

  /// Build decoration for a field based on its state
  InputDecoration _buildDecoration(int index) {
    final isFocused = widget.focusNodes[index].hasFocus;

    return FieldDecorationBuilder.build(
      fieldStyle: widget.fieldStyle,
      theme: _theme,
      isFocused: isFocused,
      hasError: widget.hasError,
      enabled: widget.enabled,
      fieldWidth: widget.fieldWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.controllers.length, (index) {
        // Add extra spacing between 3rd and 4th fields (index 3)
        final isMiddleGap = index == 3;
        final leftMargin = isMiddleGap
            ? widget.centerSpacing ?? widget.fieldSpacing * 1.5
            : widget.fieldSpacing / 2;

        return Container(
          margin: EdgeInsets.only(
            left: leftMargin,
            right: widget.fieldSpacing / 2,
          ),
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          child: Focus(
            onKeyEvent: (node, event) {
              if (!widget.enabled) {
                return KeyEventResult.ignored;
              }

              // Only handle key down events (ignore released)
              if (event is KeyDownEvent) {
                final controller = widget.controllers[index];

                // Handle backspace
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  if (controller.text.isEmpty && index > 0) {
                    // If current field is empty and not first, move to previous field
                    widget.focusNodes[index - 1].requestFocus();
                    widget.controllers[index - 1].clear();
                    return KeyEventResult.handled;
                  }
                }
                // Left arrow: move to previous field
                else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  if (index > 0) {
                    widget.focusNodes[index - 1].requestFocus();
                    // Move cursor to end
                    widget.controllers[index - 1].selection =
                        TextSelection.fromPosition(
                      TextPosition(
                        offset: widget.controllers[index - 1].text.length,
                      ),
                    );
                    return KeyEventResult.handled;
                  }
                }
                // Right arrow: move to next field
                else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                  if (index < widget.controllers.length - 1) {
                    widget.focusNodes[index + 1].requestFocus();
                    // Move cursor to end
                    widget.controllers[index + 1].selection =
                        TextSelection.fromPosition(
                      TextPosition(
                        offset: widget.controllers[index + 1].text.length,
                      ),
                    );
                    return KeyEventResult.handled;
                  }
                }
              }
              return KeyEventResult.ignored;
            },
            child: TextField(
              controller: widget.controllers[index],
              focusNode: widget.focusNodes[index],
              enabled: widget.enabled,
              textAlign: TextAlign.center,
              keyboardType: _getKeyboardType(),
              textCapitalization: widget.textCapitalization,
              maxLength: 1,
              obscureText: widget.obscureText,
              obscuringCharacter: widget.obscuringCharacter,
              style: widget.enabled
                  ? widget.textStyle
                  : widget.textStyle.copyWith(
                      color: widget.textStyle.color?.withOpacity(0.5),
                    ),
              showCursor: widget.showCursor ?? _theme.showCursor,
              cursorColor: widget.cursorColor ?? _theme.cursorColor,
              cursorHeight: widget.cursorHeight ?? _theme.cursorHeight,
              cursorWidth: widget.cursorWidth ?? _theme.cursorWidth,
              decoration: _buildDecoration(index),
              inputFormatters: _getInputFormatters(),
              onChanged: (value) {
                _onTextChanged(index, value);
              },
              onTap: () {
                // Move cursor to end when tapped
                widget.controllers[index].selection =
                    TextSelection.fromPosition(
                  TextPosition(offset: widget.controllers[index].text.length),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
