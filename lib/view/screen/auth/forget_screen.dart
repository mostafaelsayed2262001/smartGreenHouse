// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/auth/pin_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: mqh * 0.15,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: mqh * 0.30,
                width: mqw * 0.9,

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/auth/forgetpass.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(height: mqh * 0.02),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(
                      color: HexColor('#838383'), fontSize: 20),
                  label: TextUtils
                    (text: 'Enter Your E-Mail',
                     fontSize: 20,
                    color: Colors.grey
                  ),
                ),
              ),
            ),
            SizedBox(height: mqh * 0.05),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const PinScreen()),);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: TextUtils(text: 'Send',color: Colors.white,

                          fontSize: 20,
                        ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
