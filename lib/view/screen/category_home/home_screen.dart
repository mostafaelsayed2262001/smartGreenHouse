import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/drawer_widget/drawer_listTile_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/category_home/motors_screen.dart';
import 'package:smartfarm/view/screen/category_home/sensor_screen.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:smartfarm/view_model/cubit/sensor_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final sensorController = Get.put(SensorController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          state == AuthLoader() ? CircularProgressIndicator() : null;
        },
        builder: (context, state) {
          return Scaffold(
            drawer: drawerListTile(context),
            appBar: AppBar(elevation: 0),
            body: Column(children: [
              Container(
                width: double.infinity,
                height: mq.height * 0.2,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return TextUtils(
                              text:
                                  'Hello ${AuthCubit.get(context).userData['data']['fullName']}',
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 50,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                          text: 'Welcome in Your Smart Green House ',
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 40,
                          maxLines: 2,
                          color: Colors.grey.shade300,
                        ),
                      ]),
                ),
              ),
              Container(
                height: mq.height * 0.31,
                width: double.infinity,
                padding: EdgeInsets.all(18),
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        sensorController.lDRSensors();
                        sensorController.fanSensors();
                        sensorController.pumpSensors();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SensorScreen(),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 1,
                                  blurRadius: 5),
                            ]),
                        child: Column(children: [
                          Expanded(
                              child: Icon(
                                Icons.sensors,
                                size: 100,
                                color: Colors.black87,
                              ),
                              flex: 4),
                          Expanded(
                            child: TextUtils(
                              text: 'Sensors ',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            flex: 1,
                          ),
                        ]),
                      ),
                    ),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  AuthCubit.get(context).userData["role"] == "admin"
                      ? Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MotorsScreen(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius: 1,
                                        blurRadius: 5),
                                  ]),
                              child: Column(children: [
                                Expanded(
                                    child: Icon(
                                      Icons.construction,
                                      size: 100,
                                      color: Colors.black87,
                                    ),
                                    flex: 4),
                                Expanded(
                                  child: TextUtils(
                                    text: 'Motors ',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  flex: 1,
                                ),
                              ]),
                            ),
                          ),
                          flex: 1,
                        )
                      : Expanded(child: SizedBox()),
                ]),
              ),
              Container(
                height: mq.height * 0.31,
                width: double.infinity,
                padding: EdgeInsets.all(18),
                child: Row(children: [
                  AuthCubit.get(context).userData["role"] == "admin"
                      ? Expanded(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius: 1,
                                        blurRadius: 5),
                                  ]),
                              child: Column(children: [
                                Expanded(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 100,
                                      color: Colors.black87,
                                    ),
                                    flex: 4),
                                Expanded(
                                  child: TextUtils(
                                    text: 'Camera ',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  flex: 1,
                                ),
                              ]),
                            ),
                          ),
                          flex: 1,
                        )
                      : Expanded(child: SizedBox()),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(child: Container()),
                ]),
              ),
            ]),
          );
        },
      ),
    );
  }
}
