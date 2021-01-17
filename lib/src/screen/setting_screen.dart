import 'package:coronator/src/interface/setting_interface.dart';
import 'package:coronator/src/screen/component/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  final SettingInterface interface;

  const SettingScreen({Key key, @required this.interface}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
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
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Syarat & Ketentuan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Hind",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch('https://coronator.id/privacy')) {
                          await launch(
                            'https://coronator.id/privacy',
                          );
                        } else {
                          Clipboard.setData(
                            ClipboardData(text: 'https://coronator.id/privacy'),
                          );

                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "URL Terms berhasil dicopy. Silahkan buka di browser.",
                            ),
                          ));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Privasi",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Hind",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Button(
                            onTap: (BuildContext context) async {
                              await this.interface.tapLogout(context);
                            },
                            buttonText: "LOG OUT",
                            width: 175,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
