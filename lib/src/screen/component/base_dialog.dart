import 'package:flutter/material.dart';

class BaseDialog {
  Future<void> info(
    BuildContext context,
    String text, {
    Widget cancelButton,
    Widget confirmButton,
  }) async {
    List<Widget> button = [];
    List<Widget> bodyWidget = [];

    if (cancelButton != null) {
      button.add(cancelButton);
    }

    if (confirmButton != null) {
      button.add(confirmButton);
    }

    bodyWidget.add(Text(text));

    if (button.length > 0) {
      bodyWidget.add(SizedBox(
        height: 50,
      ));
    }

    bodyWidget.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: button,
    ));

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: bodyWidget,
            ),
          ),
        );
      },
    );
  }
}
