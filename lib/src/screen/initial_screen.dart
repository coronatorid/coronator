import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';

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
                    height: 60,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        width: 100,
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
                            onTap: () =>
                                Navigator.of(context).pushNamed('/login'),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
