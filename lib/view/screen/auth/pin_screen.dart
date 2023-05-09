import 'package:flutter/material.dart';
import 'package:smartfarm/view/layout/auth/pin_widget.dart';

import '../../layout/text_utiles.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(
              height: mqh * 0.1,
            ),
            Container(
              height: mqh * 0.2,
              alignment: Alignment.center,
              child: Image.asset('images/auth/verify.jpg'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextUtils(
                  text: "Verify Code",
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: mqh * 0.01,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextUtils(
                  text: "Enter  Code and New Password",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            SizedBox(
              height: mqh * 0.05,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PinputExample()),
          ],
        ),
      )),
    );
  }
}
