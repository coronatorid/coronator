import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OtpScreen extends StatelessWidget {
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
                    "OTP",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Masukan nomor OTP yang dikirim melalui whatsapp.",
                    style: TextStyle(
                      fontFamily: 'Hind',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50,
                        child: TextFormField(
                          onChanged: (String value) {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: CustomColor.maire,
                            filled: true,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          maxLengthEnforced: true,
                          enableSuggestions: false,
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(fontFamily: 'Hind', fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TextFormField(
                          onChanged: (String value) {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: CustomColor.maire,
                            filled: true,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          maxLengthEnforced: true,
                          enableSuggestions: false,
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(fontFamily: 'Hind', fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TextFormField(
                          onChanged: (String value) {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: CustomColor.maire,
                            filled: true,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          maxLengthEnforced: true,
                          enableSuggestions: false,
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(fontFamily: 'Hind', fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TextFormField(
                          onChanged: (String value) {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: CustomColor.maire,
                            filled: true,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          maxLengthEnforced: true,
                          enableSuggestions: false,
                          maxLines: 1,
                          minLines: 1,
                          style: TextStyle(fontFamily: 'Hind', fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Tidak menerima OTP? Coba kirim otp lagi.",
                          style: TextStyle(
                            fontFamily: "Hind",
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "SUBMIT",
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: CustomColor.lightCoral,
                                onTap: () {
                                  Navigator.of(context).pushNamed('/timeline');
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )));
    }));
  }
}
