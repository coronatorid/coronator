import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
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
              Text(
                "Log aktifitas Anda.",
                style: TextStyle(
                  fontFamily: 'Hind',
                ),
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    positiveCases(context),
                    suspectedCases(context),
                    positiveCases(context),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }

  Widget suspectedCases(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 15),
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
}
