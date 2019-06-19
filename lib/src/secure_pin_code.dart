import 'package:flutter/material.dart';

import './code_view.dart';
import './custom_keyboard.dart';

class SecurePinCode extends StatefulWidget {
  /// Widget will be set as Title1 of Screen, has no effect if not given
  /// Defaults to: [Null].
  final Widget upperTitle;

  /// Widget will be set as Title2 of Screen, has no effect if not given
  /// Defaults to: [Null].
  final Widget upperSubTitle;

  /// Widget will be set as Title1 of Screen, has no effect if not given
  /// Defaults to: [Null].
  final Widget bottomTitle;

  /// Widget will be set as Title2 of Screen, has no effect if not given
  /// Defaults to: [Null].
  final Widget bottomSubTitle;

  /// CorrectPin! used in on Full Pin Entered callback to call [onCodeSuccess]
  /// or [onCodeFails] callbacks
  /// Required String!.
  final String correctPin;

  /// Callback called on Full Code Entered and Code matches [correctPin],
  /// Required CallBack/Function!.
  final Function onCodeSuccess;

  /// Callback called on Full Code Entered and Code doesn't matches [correctPin],
  /// Required CallBack/Function!.
  final Function onCodeFails;

  /// Length of Code/Boxes, this must match the [correctPin]
  /// Defaults to : 4
  final int codeLength;

  /// is Pin Should be obscured,
  /// Defaults to : [True]
  final bool obscurePin;

  /// Background Color of the Screen.
  /// Defaults to : Theme.of(context).scaffoldBackgroundColor.
  final Color backgroundColor;

  /// [PinCodeKeyboard] buttons textStyle,
  final TextStyle keyboardTextStyle;

  /// [PinCodeBoxes] buttons textStyle,
  /// Defaults to : Colors.white24.
  final Color underlineBorderColor;

  const SecurePinCode({
    Key key,
    this.upperTitle,
    this.upperSubTitle,
    this.bottomTitle,
    this.bottomSubTitle,
    @required this.correctPin,
    @required this.onCodeSuccess,
    @required this.onCodeFails,
    this.codeLength = 4,
    this.obscurePin = true,
    this.backgroundColor,
    this.keyboardTextStyle = const TextStyle(color: Colors.white),
    this.underlineBorderColor = Colors.white24,
  }) : super(key: key);

  SecurePinCodeState createState() => SecurePinCodeState();
}

class SecurePinCodeState extends State<SecurePinCode> {
  String enteredPinCode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                if (widget.upperTitle != null) ...[
                  Expanded(flex: 1, child: Container()),
                  widget.upperTitle,
                ],
                if (widget.upperSubTitle != null) ...[
                  Expanded(flex: 1, child: Container()),
                  widget.upperSubTitle,
                ],
                PinCodeBoxes(
                  underlineBorderColor: widget.underlineBorderColor,
                  code: enteredPinCode,
                  obscurePin: widget.obscurePin,
                  length: widget.codeLength,
                ),
                if (widget.bottomTitle != null) ...[
                  Expanded(flex: 1, child: Container()),
                  widget.bottomTitle,
                ],
                if (widget.bottomSubTitle != null) ...[
                  Expanded(flex: 1, child: Container()),
                  widget.bottomSubTitle,
                ],
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
          PinCodeKeyboard(
            textStyle: widget.keyboardTextStyle,
            onPressedKey: (key) {
              if (enteredPinCode.length < widget.codeLength) {
                setState(() {
                  enteredPinCode = enteredPinCode + key;
                });
              }
              if (enteredPinCode.length == widget.codeLength) {
                if (enteredPinCode == widget.correctPin) {
                  widget.onCodeSuccess(enteredPinCode);
                } else {
                  widget.onCodeFails(enteredPinCode);
                  enteredPinCode = "";
                }
              }
            },
            onBackPressed: () {
              int codeLength = enteredPinCode.length;
              if (codeLength > 0)
                setState(() {
                  enteredPinCode = enteredPinCode.substring(0, codeLength - 1);
                });
            },
          ),
        ],
      ),
    );
  }
}
