import 'package:flutter/material.dart';

class PinCodeKeyboard extends StatelessWidget {
  /// Callback called on anyKey pressed from this Keyboard,
  /// Required CallBack!.
  final Function onPressedKey;

  /// Callback called on deleteKey pressed from this Keyboard,
  /// Required CallBack!.
  final Function onBackPressed;

  /// Keyboard Buttons Style and Delete button color takes color from it,
  /// Required TextStyle!
  final TextStyle textStyle;

  /// Keyboard Buttons Style and Delete button color takes color from it,
  /// Required Padding.
  final EdgeInsets keyboardPadding;

  PinCodeKeyboard({
    @required this.onBackPressed,
    @required this.onPressedKey,
    @required this.textStyle,
    @required this.keyboardPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: keyboardPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () => onPressedKey("1"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "1",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("2"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "2",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("3"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "3",
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () => onPressedKey("4"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "4",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("5"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "5",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("6"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "6",
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () => onPressedKey("7"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "7",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("8"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "8",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("9"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "9",
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () => onPressedKey("0"),
                icon: Text(
                  "",
                  style: textStyle,
                ),
              ),
              IconButton(
                onPressed: () => onPressedKey("0"),
                icon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "0",
                    style: textStyle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onBackPressed(),
                icon: Icon(
                  Icons.backspace,
                  color: textStyle.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
