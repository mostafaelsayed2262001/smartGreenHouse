
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/screen/auth/forget_screen.dart';
import 'package:smartfarm/view/screen/category_home/home_screen.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mqw = MediaQuery.of(context).size.width;
    var mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: mqw * 0.1,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mqh * 0.2,
                ),
                Container(
                  height: mqh*0.25,
                  child: Image.asset('images/auth/login.jpg'),
                ),

                SizedBox(
                  height: mqh * 0.03,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.roboto(
                        color: HexColor('#838383'), fontSize: 20),
                    label: TextUtils(
                      text: 'Username',
                      color: kCOlor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: mqh * 0.05,
                ),
                TextFormField(
                  validator: (value) {},
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: HexColor('#838383'), fontSize: 20),
                      label: TextUtils(
                        text: 'Password',
                        color: kCOlor,
                        fontSize: 20,
                      )),
                ),
                SizedBox(
                  height: mqh*0.001,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ForgetPasswordScreen()),
                      );
                    },
                    child: TextUtils(
                      text: 'Forget Password',
                      color: kCOlor,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: mqh * 0.07,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                      onPressed: () {
                        ///
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15)),
                        child: Text('Login',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            )),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
