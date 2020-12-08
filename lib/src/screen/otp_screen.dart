import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/otp_interface.dart';
import 'package:coronator/src/provider/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  final OTPInterface interface;

  OTPScreen(this.interface);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      OTPProvider otpProvider =
          Provider.of<OTPProvider>(context, listen: false);

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
                          onChanged: (String value) {
                            otpProvider.setOTP(value, 0);
                          },
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
                          onChanged: (String value) {
                            otpProvider.setOTP(value, 1);
                          },
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
                          onChanged: (String value) {
                            otpProvider.setOTP(value, 2);
                          },
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
                          onChanged: (String value) {
                            otpProvider.setOTP(value, 3);
                          },
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
                        onTap: () {
                          this.interface.resendOTP(context);
                        },
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
                                  this.interface.submitOTP(context);
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
