import 'package:flutter/material.dart';
import 'package:flutter_otp_textfield/flutter_otp_textfield.dart';

import 'otp_dialog.dart';

class ExampleButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String exampleId;
  final OTPFieldStyle fieldStyle;
  final OTPInputType inputType;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool showErrorDemo;
  final bool useCustomTheme;
  final int fieldCount;

  const ExampleButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.exampleId,
    required this.fieldStyle,
    required this.inputType,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.showErrorDemo = false,
    this.useCustomTheme = false,
    this.fieldCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => OtpDialog(
              title: title,
              exampleId: exampleId,
              fieldStyle: fieldStyle,
              inputType: inputType,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              showErrorDemo: showErrorDemo,
              useCustomTheme: useCustomTheme,
              fieldCount: fieldCount,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
