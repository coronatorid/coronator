import 'package:camera/camera.dart';
import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/camera_interface.dart';
import 'package:coronator/src/provider/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatelessWidget {
  final CameraInterface interface;

  CameraScreen(this.interface);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(null);
        return true;
      },
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return SafeArea(
              child: Container(
                child: Column(
                  children: [
                    // Expanded
                    Expanded(
                      child: Consumer<CameraProvider>(
                          builder: (context, cameraProvider, _) {
                        if (cameraProvider.initialized) {
                          return Container(
                            child: CameraPreview(cameraProvider.controller),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 25,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildAlert(),
                          buildCameraButton(context),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildCameraButton(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Image(
              image: AssetImage('assets/images/camera.png'),
              height: 40,
              width: 40,
              color: CustomColor.redTheme.withAlpha(255),
            ),
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              border: Border.all(
                color: CustomColor.redTheme.withAlpha(255),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                splashColor: CustomColor.redTheme.withAlpha(255),
                onTap: () async {
                  await this.interface.takePicture(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildAlert() {
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
