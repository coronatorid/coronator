import 'package:coronator/src/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
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
                onChanged: (String value) {},
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
                maxLength: 12,
                enableSuggestions: false,
                maxLines: 1,
                minLines: 1,
                style: TextStyle(fontFamily: 'Hind', fontSize: 16),
              ),
              SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "KIRIM OTP",
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: CustomColor.lightCoral,
                            onTap: () {
                              Navigator.of(context).pushNamed('/otp');
                            },
                          ),
                        ),
                      )
                    ],
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
