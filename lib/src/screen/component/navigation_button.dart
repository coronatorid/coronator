import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Function(BuildContext) onTap;
  final AssetImage image;
  final String text;

  const NavigationButton({
    Key key,
    @required this.onTap,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onTap(context);
      },
      customBorder: CircleBorder(),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            child: Image(
              image: this.image,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            this.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
