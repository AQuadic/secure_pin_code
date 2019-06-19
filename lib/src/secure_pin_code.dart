import 'package:flutter/material.dart';

import './code_view.dart';
import './custom_keyboard.dart';

class SecurePinCode extends StatefulWidget {
  /// Widget will be set as Title of Screen,
  /// Required Widget!.
  final Widget title;

  /// Widget will be set as SubTitle of Screen,
  /// Required Widget!.
  final Widget subTitle;

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

  /// String that will be printed in Error Section, has no effect if not given
  /// Defaults to: [Null].
  final Widget errorWidget;

  /// Length of Code/Boxes, this must match the [correctPin]
  /// Defaults to : 4
  final int codeLength;

  /// is Pin Should be obscured,
  /// Defaults to : [True]
  final bool obscurePin;

  /// Background Color of the Screen.
  /// Defaults to : Theme.of(context).scaffoldBackgroundColor
  final Color backgroundColor;

  /// [PinCodeKeyboard] buttons textStyle
  final TextStyle keyboardTextStyle;

  const SecurePinCode({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.correctPin,
    @required this.onCodeSuccess,
    @required this.onCodeFails,
    this.errorWidget,
    this.codeLength = 4,
    this.obscurePin = true,
    this.backgroundColor,
    this.keyboardTextStyle = const TextStyle(color: Colors.white),
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
                Expanded(flex: 2, child: Container()),
                widget.title,
                Expanded(flex: 1, child: Container()),
                widget.subTitle,
                Expanded(flex: 2, child: Container()),
                CodeView(
                  code: enteredPinCode,
                  obscurePin: widget.obscurePin,
                  length: widget.codeLength,
                ),
                Expanded(flex: 1, child: Container()),
                if (widget.errorWidget != null) ...[
                  widget.errorWidget,
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
