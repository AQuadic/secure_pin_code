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
        backgroundColor: Colors.black,
        errorWidget: Text(
          "this.error",
          style: TextStyle(color: Colors.white),
        ),
        title: Text(
          "المرحلة   9  |  8",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        subTitle: Text(
          "برجاء إدخال الرمز المكون من 4 أرقام",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        obscurePin: true,
        // to make pin * instead of number
        codeLength: 4,
        correctPin: "****",
        onCodeSuccess: (val) {},
        onCodeFails: (val) {
//        _savePinAndNav(val);
        },
      ),
    );
  }
}
