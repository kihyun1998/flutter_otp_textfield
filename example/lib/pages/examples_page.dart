import 'package:flutter/material.dart';
import 'package:flutter_otp_textfield/flutter_otp_textfield.dart';

import '../widgets/example_button.dart';

class ExamplesPage extends StatelessWidget {
  const ExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP TextField Examples'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: const [
          ExampleButton(
            title: 'Basic Box',
            subtitle: 'Numbers Only',
            icon: Icons.grid_on,
            exampleId: 'basic',
            fieldStyle: OTPFieldStyle.box,
            inputType: OTPInputType.number,
          ),
          ExampleButton(
            title: 'Underline',
            subtitle: 'Clean Style',
            icon: Icons.horizontal_rule,
            exampleId: 'underline',
            fieldStyle: OTPFieldStyle.underline,
            inputType: OTPInputType.number,
          ),
          ExampleButton(
            title: 'Circle',
            subtitle: 'Round Style',
            icon: Icons.circle_outlined,
            exampleId: 'circle',
            fieldStyle: OTPFieldStyle.circle,
            inputType: OTPInputType.number,
          ),
          ExampleButton(
            title: 'Text Input',
            subtitle: 'Letters Only',
            icon: Icons.abc,
            exampleId: 'text',
            fieldStyle: OTPFieldStyle.box,
            inputType: OTPInputType.text,
            textCapitalization: TextCapitalization.characters,
          ),
          ExampleButton(
            title: 'Alphanumeric',
            subtitle: 'Mixed Input',
            icon: Icons.text_fields,
            exampleId: 'alphanumeric',
            fieldStyle: OTPFieldStyle.box,
            inputType: OTPInputType.any,
            textCapitalization: TextCapitalization.characters,
          ),
          ExampleButton(
            title: 'Secure PIN',
            subtitle: 'Password Mode',
            icon: Icons.lock,
            exampleId: 'obscure',
            fieldStyle: OTPFieldStyle.circle,
            inputType: OTPInputType.number,
            obscureText: true,
          ),
          ExampleButton(
            title: 'Error State',
            subtitle: 'Try: 123456',
            icon: Icons.error_outline,
            exampleId: 'error',
            fieldStyle: OTPFieldStyle.box,
            inputType: OTPInputType.number,
            showErrorDemo: true,
          ),
          ExampleButton(
            title: 'Custom Theme',
            subtitle: 'Purple Style',
            icon: Icons.palette,
            exampleId: 'custom',
            fieldStyle: OTPFieldStyle.box,
            inputType: OTPInputType.number,
            useCustomTheme: true,
          ),
          ExampleButton(
            title: '4-Digit Code',
            subtitle: 'Short OTP',
            icon: Icons.pin,
            exampleId: 'four',
            fieldStyle: OTPFieldStyle.underline,
            inputType: OTPInputType.number,
            fieldCount: 4,
          ),
        ],
      ),
    );
  }
}
