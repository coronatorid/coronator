import 'package:coronator/src/core/color.dart';
import 'package:coronator/src/interface/login_interface.dart';
import 'package:coronator/src/provider/login_provider.dart';
import 'package:coronator/src/screen/component/alert_text.dart';
import 'package:coronator/src/screen/component/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final LoginInterface interface;

  LoginScreen(this.interface);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Masukan nomor whatsapp untuk bisa memasuki aplikasi.",
                    style: TextStyle(
                      fontFamily: 'Hind',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onChanged: loginProvider.setPhoneNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      fillColor: CustomColor.maire,
                      filled: true,
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "+62",
                          style: TextStyle(
                            fontFamily: 'Hind',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    maxLength: 11,
                    enableSuggestions: false,
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(fontFamily: 'Hind', fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<LoginProvider>(
                    builder: (_, loginProvider, __) {
                      if (loginProvider.errorString() == null) {
                        return Container();
                      }

                      return AlertText(loginProvider.errorString());
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        buttonText: "KIRIM OTP",
                        onTap: () {
                          this.interface.sendOtp(context);
                        },
                        width: 150,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
