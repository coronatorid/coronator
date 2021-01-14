import 'package:flutter/material.dart';

class BaseDialog {
  Future<void> info(
    BuildContext context,
    String text, {
    Widget cancelButton,
    Widget confirmButton,
  }) async {
    List<Widget> button = [];

    if (cancelButton != null) {
      button.add(cancelButton);
    }

    if (confirmButton != null) {
      button.add(confirmButton);
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: button,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
