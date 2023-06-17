import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_field_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';

class TemperatureScreen extends StatelessWidget {
  TemperatureScreen({Key? key}) : super(key: key);
  final ctrlField = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(Icons.lightbulb_circle_outlined,
                    size: MediaQuery.of(context).size.height * .45),
              )),
              TextUtils(text: 'Plant Temperature', fontSize: 18),
              TextFieldWidgt(
                  lable: "Number",
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    return null;
                  },
                  ctrl: ctrlField,
                  iconData: Icons.numbers,
                  suffix: SizedBox()),
              Center(
                child: InkWell(
                  onTap: () async {
                    await AuthCubit.get(context).tempMachine(context,ctrlField.text);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                    ),
                    child: Center(
                        child: TextUtils(
                            text: "Send Temperature",
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
