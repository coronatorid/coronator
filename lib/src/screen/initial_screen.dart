import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/screen/component/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              width: screenWidth - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Coronator",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: AssetImage('assets/icons/logo_64.png'),
                    width: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '"One step forward to perfect contact tracing"',
                    style: TextStyle(
                      fontFamily: 'Hind',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Button(
                    buttonText: "LOGIN",
                    onTap: (BuildContext context) =>
                        Navigator.of(context).pushNamed('/login'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  buildTos(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  RichText buildTos(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Hind',
          fontSize: 12,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text:
                "Dengan menggunakan aplikasi ini maka kalian setuju dengan \n",
          ),
          TextSpan(
            text: "syarat dan ketentuan yang berlaku",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch('https://coronator.id/terms')) {
                  await launch(
                    'https://coronator.id/terms',
                  );
                } else {
                  Clipboard.setData(
                    ClipboardData(text: 'https://coronator.id/terms'),
                  );

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "URL Terms berhasil dicopy. Silahkan buka di browser.",
                    ),
                  ));
                }
              },
          ),
        ],
      ),
    );
  }
}
