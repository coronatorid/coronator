import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';

class InlineAlertNotice extends StatelessWidget {
  final Widget content;

  InlineAlertNotice({
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CustomColor.redTheme.withAlpha(255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            child: Image(
              image: AssetImage('assets/images/alert.png'),
              width: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: this.content,
          ),
        ],
      ),
    );
  }
}
