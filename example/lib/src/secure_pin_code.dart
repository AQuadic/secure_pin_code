import 'package:flutter/material.dart';
import 'package:secure_pin_code/secure_pin_code.dart';

class SecurePinCodeExample extends StatefulWidget {
  @override
  _SecurePinCodeExampleState createState() => _SecurePinCodeExampleState();
}

class _SecurePinCodeExampleState extends State<SecurePinCodeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecurePinCode(
        upperTitle: Container(
          color: Color(0xFF6D6DFF),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text("upperTitle"),
        ),
        upperSubTitle: Container(
          color: Color(0xFF6D6DFF),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text("upperSubTitle"),
        ),
        bottomTitle: Container(
          color: Color(0xFF6D6DFF),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text("bottomTitle"),
        ),
        bottomSubTitle: Container(
          color: Color(0xFF6D6DFF),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text("bottomSubTitle"),
        ),
        backgroundColor: Colors.black,
        obscurePin: true,
        // to make pin * instead of number
        codeLength: 4,
        correctPin: "****",
        onCodeSuccess: (val) {},
        onCodeFails: (val) {},
      ),
    );
  }
}
