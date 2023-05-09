import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/utils/my_string.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: TextUtils(
            text: 'Setting',
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.aspectRatio * 40,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: Container(
        child: Column(children: [
          Container(
              height: mq.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  TextUtils(
                    text: 'Conditin and terms',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mq.aspectRatio * 32,
                  ),
                ],
              )),
          Divider(
            thickness: 1,
          ),
          Container(
              height: mq.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  TextUtils(
                    text: 'Language',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mq.aspectRatio * 32,
                  ),
                  Spacer(),
                  TextUtils(
                    text: english,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: mq.aspectRatio * 32,
                  )
                ],
              )),
          Divider(thickness: 1,)

        ]),
      ),
    );
  }
}
