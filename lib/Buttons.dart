import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;

  Button(
      {required this.color, required this.textColor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          color: this.color,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(color: this.textColor),
            textScaleFactor: 1.5,
          )),
        ),
      ),
    );
  }
}
