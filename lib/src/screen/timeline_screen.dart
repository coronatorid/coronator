import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/screen/component/base_dialog.dart';
import 'package:coronator/src/screen/component/button.dart';
import 'package:coronator/src/screen/component/navigation_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelineScreen extends StatelessWidget with BaseDialog {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await Permission.location.isGranted ||
          await Permission.location.isDenied) {
        return;
      }

      this.info(
        context,
        "Aplikasi ini mengumpulkan data lokasi Anda agar kami bisa memberitahu Anda jika bertemu dengan sesama pengguna yang terdeteksi positif covid-19, pengumpulan data akan tetap berjalan meskipun aplikasi ditutup jika diizinkan.\n\nAktifkan lokasi agar bisa berkontribusi bersama berperang melawan covid-19!",
        confirmButton: Button(
          buttonText: "Aktifkan",
          width: 100,
          onTap: (BuildContext context) async {
            LocationPermission permission =
                await Geolocator.requestPermission();
            print(permission.toString());
            Navigator.of(context).pop();
          },
          fontSize: 12,
        ),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationButton(
                onTap: (BuildContext context) {
                  Navigator.of(context).pushNamed("/report");
                },
                image: AssetImage('assets/images/alarm.png'),
                text: "LAPOR \nPOSITIF COVID",
              ),
              NavigationButton(
                onTap: (BuildContext context) {
                  Navigator.of(context).pushNamed("/setting");
                },
                image: AssetImage('assets/images/technical-support.png'),
                text: "SETTING",
              ),
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
                      SizedBox(
                        height: 10,
                      ),
                      noCases(),
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

  Container noCases() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColor.redTheme.withAlpha(255),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "Anda belum bertemu dengan orang yang mempunyai riwayat kasus positif maupun suspected.",
            style: TextStyle(
              fontFamily: 'Hind',
              color: CustomColor.redTheme.withAlpha(255),
            ),
          ),
        ],
      ),
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
