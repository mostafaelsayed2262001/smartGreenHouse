import 'package:flutter/material.dart';
import 'package:smartfarm/services/network/auth_services.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/motor_and_sensor_widget/row_button_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

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
          fontSize: MediaQuery.of(context).size.aspectRatio*40,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(children: [
          RowButtonWidget(context, onTap: () async{
            print('Garage');
            await AuthenticationServices().postLogout('token');
          }, icon: Icons.garage_outlined, title: "Garage", status: "Opended")
        ]),
      ),
    );
  }
}
