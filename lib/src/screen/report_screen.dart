import 'dart:io';

import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/report_interface.dart';
import 'package:coronator/src/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatelessWidget {
  final ReportInterface interface;

  ReportScreen(this.interface);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Laporkan Positif Covid",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 350,
                      child: Text(
                        "Laporan Anda membantu memberitahu sesama pengguna aplikasi coronator yang mungkin Anda paparkan.",
                        style: TextStyle(
                          fontFamily: 'Hind',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                buildAlert1(),
                SizedBox(
                  height: 10,
                ),
                buildAlert2(),
                SizedBox(
                  height: 30,
                ),
                buildForm(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildForm() {
    return Consumer<ReportProvider>(
      builder: (
        BuildContext context,
        ReportProvider reportProvider,
        __,
      ) {
        if (reportProvider.data == null) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                reportProvider.file == null
                    ? Image(
                        image: AssetImage('assets/images/800x600.png'),
                        height: 200,
                      )
                    : Image.file(
                        File(reportProvider.file.path),
                        height: 200,
                      ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColor.redTheme.withAlpha(255),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Ambil Foto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CustomColor.redTheme.withAlpha(255),
                                fontSize: 12,
                                fontFamily: 'Hind',
                              ),
                            ),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                color: CustomColor.redTheme.withAlpha(255),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                splashColor: Colors.white,
                                onTap: () async {
                                  if (await Permission.camera.isGranted ==
                                      false) {
                                    this._showMyDialog(
                                      context,
                                      'Akses untuk kamera harus diberikan untuk mengakses fitur ini',
                                    );
                                    return;
                                  }

                                  await this.interface.setPicture(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Laporkan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Hind',
                              ),
                            ),
                            width: 100,
                            decoration: BoxDecoration(
                              color: CustomColor.redTheme.withAlpha(255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                splashColor: Colors.white,
                                onTap: () async {
                                  if (await Permission.camera.isGranted ==
                                      false) {
                                    this._showMyDialog(
                                      context,
                                      'Akses untuk kamera harus diberikan untuk mengakses fitur ini',
                                    );
                                  }

                                  if (reportProvider.file == null) {
                                    this._showMyDialog(
                                      context,
                                      'Harap lampirkan foto terlebih dahulu',
                                    );
                                    return;
                                  }

                                  await this.interface.report(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return buildReportedCases(reportProvider, context);
      },
      child: Container(),
    );
  }

  Container buildReportedCases(
      ReportProvider reportProvider, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            reportProvider.data.imagePath,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
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
                  "Laporan Anda " + reportProvider.data.statusHumanized(),
                  style: TextStyle(
                    fontFamily: 'Hind',
                    color: CustomColor.redTheme.withAlpha(255),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Cabut Laporan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      width: 150,
                      decoration: BoxDecoration(
                        color: CustomColor.redTheme.withAlpha(255),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          splashColor: Colors.white,
                          onTap: () async {
                            await this.interface.removeReport(context);
                            this._showMyDialog(
                              context,
                              'Laporan berhasil dihapus',
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
        );
      },
    );
  }

  Container buildAlert2() {
    return Container(
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
                style: TextStyle(fontSize: 12),
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
    );
  }

  Container buildAlert1() {
    return Container(
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
                style: TextStyle(fontSize: 12),
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
                    text: ", ",
                    style: TextStyle(
                      fontFamily: 'Hind',
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "rumah sakit ",
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
    );
  }
}
