import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double width;
  final void Function() onTap;

  Button({
    @required this.onTap,
    @required this.buttonText,
    this.width: 100,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            this.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          width: this.width,
          decoration: BoxDecoration(
            color: CustomColor.redTheme.withAlpha(255),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: CustomColor.redTheme,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              splashColor: CustomColor.wewak,
              onTap: this.onTap,
            ),
          ),
        )
      ],
    );
  }
}
