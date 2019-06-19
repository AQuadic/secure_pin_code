import 'dart:core';

import 'package:flutter/material.dart';

class PinCodeBoxes extends StatelessWidget {
  /// Given code to display in pin code boxes
  /// Required String.
  final String code;

  /// length of boxes
  /// Required int.
  final int length;

  /// indicated of pin should be obscured or not.
  /// Required bool.
  final bool obscurePin;

  /// TextStyle to Code texts
  /// Defaults to : const TextStyle(color: Colors.white).
  final TextStyle codeTextStyle;

  /// PinCode box color,
  /// Defaults to : Colors.black12.
  final Color boxColor;

  /// Underline of pin code box color
  /// Required Color!.
  final Color underlineBorderColor;

  const PinCodeBoxes({
    @required this.code,
    @required this.length,
    @required this.obscurePin,
    this.codeTextStyle = const TextStyle(color: Colors.white),
    this.boxColor = Colors.black12,
    @required this.underlineBorderColor,
  });

  String getCodeAt(index) {
    if (code == null || code.length < index)
      return "  ";
    else if (obscurePin) {
      return "*";
    } else {
      return code.substring(index - 1, index);
    }
  }

  _getCodeViews() {
    List<Widget> widgets = [];
    for (var i = 0; i < length; i++) {
      widgets.add(
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: boxColor,
            border: Border(bottom: BorderSide(color: underlineBorderColor)),
          ),
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: Text(
            getCodeAt(i + 1),
            textAlign: TextAlign.center,
            style: codeTextStyle,
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _getCodeViews(),
    );
  }
}
