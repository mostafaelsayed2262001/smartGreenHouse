import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/motor_and_sensor_widget/row_button_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

import 'package:smartfarm/view/screen/category_home/motors_screen/garage_screen.dart';
import 'package:smartfarm/view/screen/category_home/motors_screen/temperature_screen.dart';

class MotorsScreen extends StatelessWidget {
  const MotorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        title: TextUtils(
          text: 'Motors',
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.aspectRatio * 40,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(children: [
          RowButtonWidget(context, onTap: () {


            Get.to(()=>TemperatureScreen(),transition: Transition.circularReveal,
                duration: Duration(milliseconds: 800));
          },
              icon: Icons.lightbulb_circle_outlined,
              title: "Temperature",
              status: ""),
          RowButtonWidget(context, onTap: () async {
            Get.to(()=>GarageScreen(),
                transition: Transition.circularReveal,
                duration: Duration(milliseconds: 800));
          }, icon: Icons.garage_outlined, title: "Garage", status: "")
        ]),
      ),
    );
  }
}
