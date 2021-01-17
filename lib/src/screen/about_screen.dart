import 'package:coronator/src/provider/about_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Visi\n\n",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Membuat aplikasi perfect contact tracing untuk membantu penanggulangan virus corona di Indonesia\n\n",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: "Misi\n\n",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "1. Membuat aplikasi surveillance yang aman dengan tujuan untuk meningkatkan level contact tracing dalam masalah penganggulangan virus corona di Indonesia\n\n",
                      ),
                      TextSpan(
                        text:
                            "2. Membuka semua source code yang ada dalam arsitektur aplikasi coronator agar bisa menjadi dipelajari, direview, diubah, ditingkatkan dan disebarluaskan\n\n",
                      ),
                      TextSpan(
                        text:
                            "3. Membuat aplikasi gratis tanpa pengurangan fitur sedikitpun sehingga semua orang dapat menggunakan-nya untuk berkontribusi bersama menanggulangi penyebaran virus corona di Indonesia\n\n",
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Consumer<AboutProvider>(
                builder: (_, aboutProvider, __) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Versi Aplikasi: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${aboutProvider?.packageInfo?.version?.toString()}\n\n",
                          ),
                          TextSpan(
                            text: "Lihat change log",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (await canLaunch(
                                    'https://coronator.id/changelog')) {
                                  await launch(
                                    'https://coronator.id/changelog',
                                  );
                                } else {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: 'https://coronator.id/terms'),
                                  );

                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      "URL Terms berhasil dicopy. Silahkan buka di browser.",
                                    ),
                                  ));
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
