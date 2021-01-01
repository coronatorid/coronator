import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Laporkan Positif Covid",
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
                    Container(
                      width: 350,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Hind',
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Taruh surat keterangan positif covid pada form dibawah.\n",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
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
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Sensor semua informasi kecuali ",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "nama ",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "dan ",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "tanggal ",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "dimana Anda dinyatakan covid.",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Segala kebocoran informasi selain nama dan tanggal Anda terkena covid",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: " bukan menjadi tanggung jawab kami",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
