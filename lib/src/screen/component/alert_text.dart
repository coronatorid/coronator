import 'package:flutter/material.dart';

class AlertText extends StatelessWidget {
  final String text;

  AlertText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontFamily: 'Hind',
        fontSize: 14,
        color: Colors.red,
      ),
    );
  }
}
