import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/timeline_interface.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelineScreen extends StatelessWidget {
  final TimelineInterface interface;

  TimelineScreen(this.interface);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/report");
                },
                customBorder: CircleBorder(),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      child: Image(
                        image: AssetImage('assets/images/alarm.png'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "LAPOR \nPOSITIF COVID",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await this.interface.tapLogout(context);
                },
                customBorder: CircleBorder(),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      child: Image(
                        image: AssetImage('assets/images/logout.png'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "LOGOUT",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Timeline",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log aktifitas Anda.",
                      style: TextStyle(
                        fontFamily: 'Hind',
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const phoneNumber = 'tel:112';
                        if (await canLaunch(phoneNumber)) {
                          await launch(phoneNumber);
                        } else {}
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                              size: 15,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Hubungi Call Center 112",
                              style: TextStyle(
                                fontFamily: 'Hind',
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    children: [
                      // TODO: Call api for this
                      // positiveCases(context),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // suspectedCases(context),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // positiveCases(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget suspectedCases(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // https://www.flaticon.com/free-icon/sick_983053?term=sick&page=1&position=69&k=1604432100038
          Image(
            image: AssetImage('assets/images/sick.png'),
            width: 75,
          ),
          SizedBox(width: 15),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 50),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomColor.wewak,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Hind',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Peringatan kasus suspected\n\n",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "Pada tanggal"),
                            TextSpan(
                                text: " 31 November 2020",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:
                                  " Anda berada pada jarak kurang dari 2 meter selama 15 menit bersama pasien",
                            ),
                            TextSpan(
                                text: " suspected",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: " corona!",
                            ),
                            TextSpan(
                              text: "\n\nLihat lokasi disini",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  if (await canLaunch(
                                      "https://www.google.com/maps/@-6.2828349,106.8194158,20z")) {
                                    await launch(
                                      "https://www.google.com/maps/@-6.2828349,106.8194158,20z",
                                    );
                                  } else {
                                    Clipboard.setData(
                                      ClipboardData(
                                          text:
                                              "https://www.google.com/maps/@-6.2828349,106.8194158,20z"),
                                    );
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          "URL berhasil di copy, silahkan buka di browser karena aplikasi tidak bisa membukanya langsung."),
                                    ));
                                  }
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget positiveCases(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 15),
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/icons/logo_64.png'),
            width: 75,
          ),
          SizedBox(width: 15),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 50),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomColor.wewak,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Hind',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Peringatan kasus positif\n\n",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "Pada tanggal"),
                            TextSpan(
                                text: " 31 November 2020",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:
                                  " Anda berada pada jarak kurang dari 2 meter selama 15 menit bersama pasien",
                            ),
                            TextSpan(
                                text: " positif",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: " corona!",
                            ),
                            TextSpan(
                                text: "\n\nLihat lokasi disini",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (await canLaunch(
                                        "https://www.google.com/maps/@-6.2828349,106.8194158,20z")) {
                                      await launch(
                                        "https://www.google.com/maps/@-6.2828349,106.8194158,20z",
                                      );
                                    } else {
                                      Clipboard.setData(
                                        ClipboardData(
                                            text:
                                                "https://www.google.com/maps/@-6.2828349,106.8194158,20z"),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "URL berhasil di copy, silahkan buka di browser karena aplikasi tidak bisa membukanya langsung."),
                                      ));
                                    }
                                  })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
