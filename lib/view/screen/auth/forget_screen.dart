import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/services/network/auth_services.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/auth/pin_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController ctrlemail = TextEditingController();

  final keyAuth = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: mqh * 0.12,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 25,
                    ))),
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
              child: Form(
                key: keyAuth,
                child: TextFormField(
                  controller: ctrlemail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.montserrat(
                        color: HexColor('#838383'), fontSize: 20),
                    label: TextUtils(
                        text: 'Enter Your E-Mail',
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: mqh * 0.015),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                  ),
                  onPressed: () async {
                    ///

                    if (keyAuth.currentState!.validate()) {
                      Map<String,dynamic> x = await AuthenticationServices().postForget(
                        email: ctrlemail.text.toString(),
                      );

                      x['status'] == 200
                          ? Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const PinScreen()),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: const TextUtils(
                                text: ' Email Not Founded ',
                                color: Colors.white,
                              ),
                              backgroundColor: (Colors.grey),
                            ));
                      ;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: TextUtils(
                      text: 'Send',
                      color: Colors.white,
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
