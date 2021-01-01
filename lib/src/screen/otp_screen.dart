import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/otp_interface.dart';
import 'package:coronator/src/provider/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  final OTPInterface interface;

  OTPScreen(this.interface);

  final List<FocusNode> focusNodeList = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

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
                        child: buildOTPField(context, otpProvider, 0, true),
                      ),
                      Container(
                        width: 50,
                        child: buildOTPField(context, otpProvider, 1, false),
                      ),
                      Container(
                        width: 50,
                        child: buildOTPField(context, otpProvider, 2, false),
                      ),
                      Container(
                        width: 50,
                        child: buildOTPField(context, otpProvider, 3, false),
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            width: 150,
                            decoration: BoxDecoration(
                              color: CustomColor.redTheme.withAlpha(255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                splashColor: CustomColor.wewak,
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

  TextFormField buildOTPField(
    BuildContext context,
    OTPProvider otpProvider,
    int index,
    bool autoFocus,
  ) {
    return TextFormField(
      onChanged: (String value) {
        otpProvider.setOTP(value, index);

        if (index + 1 < this.focusNodeList.length) {
          FocusScope.of(context).requestFocus(this.focusNodeList[index + 1]);
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: CustomColor.maire,
        filled: true,
        contentPadding: EdgeInsets.all(15),
        counterText: "",
      ),
      autofocus: autoFocus,
      textAlign: TextAlign.center,
      maxLength: 1,
      maxLengthEnforced: true,
      enableSuggestions: false,
      maxLines: 1,
      minLines: 1,
      focusNode: this.focusNodeList[index],
      style: TextStyle(fontFamily: 'Hind', fontSize: 16),
    );
  }
}
