import 'package:flutter/material.dart';
import 'package:flutter_otp_textfield/flutter_otp_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/otp_provider.dart';

class OtpDialog extends ConsumerWidget {
  final String title;
  final String exampleId;
  final OTPFieldStyle fieldStyle;
  final OTPInputType inputType;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool showErrorDemo;
  final bool useCustomTheme;
  final int fieldCount;

  const OtpDialog({
    super.key,
    required this.title,
    required this.exampleId,
    required this.fieldStyle,
    required this.inputType,
    required this.obscureText,
    required this.textCapitalization,
    required this.showErrorDemo,
    required this.useCustomTheme,
    required this.fieldCount,
  });

  void _handleConfirm(BuildContext context, WidgetRef ref, String otp) {
    final params = OtpParams(exampleId: exampleId, fieldCount: fieldCount);

    if (showErrorDemo && otp != '123456') {
      // Show error
      ref.read(otpHasErrorProvider(exampleId).notifier).setError(true);

      // Clear after delay
      Future.delayed(const Duration(seconds: 1), () {
        ref.read(otpHasErrorProvider(exampleId).notifier).setError(false);
        ref.read(otpControllersProvider(params).notifier).clear();
        ref.read(currentOtpProvider(exampleId).notifier).clear();
      });
    } else {
      // Success
      Navigator.pop(context);

      // Show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'OTP Entered Successfully',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Code: $otp'),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );

      // Clear state
      ref.read(otpControllersProvider(params).notifier).clear();
      ref.read(currentOtpProvider(exampleId).notifier).clear();
      ref.read(otpHasErrorProvider(exampleId).notifier).setError(false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = OtpParams(exampleId: exampleId, fieldCount: fieldCount);
    final controllers = ref.watch(otpControllersProvider(params));
    final focusNodes = ref.watch(otpFocusNodesProvider(params));
    final currentOtp = ref.watch(currentOtpProvider(exampleId));
    final hasError = ref.watch(otpHasErrorProvider(exampleId));

    final theme = useCustomTheme ? _buildCustomTheme(context) : null;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Enter $fieldCount-digit ${_getInputTypeLabel()}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OTPTextField(
              controllers: controllers,
              focusNodes: focusNodes,
              fieldStyle: fieldStyle,
              inputType: inputType,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              hasError: hasError,
              enabled: true,
              autoFocus: true,
              theme: theme,
              centerSpacing: fieldCount == 6 ? 16 : null,
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              fieldWidth: 45,
              fieldHeight: 55,
              onChange: (value) {
                ref.read(currentOtpProvider(exampleId).notifier).update(value);
              },
              onCompleted: (otp) => _handleConfirm(context, ref, otp),
            ),
            const SizedBox(height: 24),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Wrong code! Try: 123456',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(otpControllersProvider(params).notifier).clear();
                    ref.read(currentOtpProvider(exampleId).notifier).clear();
                    ref
                        .read(otpHasErrorProvider(exampleId).notifier)
                        .setError(false);
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: currentOtp.length == fieldCount
                      ? () {
                          final otp = ref
                              .read(otpControllersProvider(params).notifier)
                              .getValue();
                          _handleConfirm(context, ref, otp);
                        }
                      : null,
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getInputTypeLabel() {
    switch (inputType) {
      case OTPInputType.number:
        return 'code';
      case OTPInputType.text:
        return 'letters';
      case OTPInputType.any:
        return 'alphanumeric';
    }
  }

  /// Builds custom theme that adapts to light/dark mode
  OTPTheme _buildCustomTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isDark) {
      // Dark mode custom theme
      return OTPTheme.custom(
        borderColor: Colors.purple.shade700,
        focusedBorderColor: Colors.purple.shade400,
        errorBorderColor: Colors.orange.shade300,
        fillColor: Colors.purple.shade900.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      );
    } else {
      // Light mode custom theme
      return OTPTheme.custom(
        borderColor: Colors.purple.shade300,
        focusedBorderColor: Colors.purple,
        errorBorderColor: Colors.orange,
        fillColor: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
      );
    }
  }
}
