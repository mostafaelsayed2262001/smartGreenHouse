import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_field_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';

class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);
  final ctrlField = TextEditingController();

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
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(Icons.garage_outlined,
                    size: MediaQuery.of(context).size.height * .4),
              )),
              TextUtils(text: 'Request To  Open / Close Garage', fontSize: 18),
              SizedBox(
                height: 30,
              ),

                 Center(
                  child: GestureDetector(
                   onTap: ()async {
                      await AuthCubit.get(context).garageRequest(context);
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
                              text: "Send Request",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                  ),
                ),

            ],
          ),
        )),
      ),
    );
  }
}
