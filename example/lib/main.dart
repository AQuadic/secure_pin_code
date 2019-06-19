import 'package:flutter/material.dart';

import 'src/secure_pin_code.dart';

void main() => runApp(TinyApp());

class TinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Pin Code Example',
      home: SecurePinCodeExample(),
    );
  }
}
