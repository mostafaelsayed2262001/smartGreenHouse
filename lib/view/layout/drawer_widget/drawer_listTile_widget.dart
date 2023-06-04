import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartfarm/services/network/sensor_io.dart';
import 'package:smartfarm/view/layout/drawer_widget/drawer_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/category_home/add_user.dart';
import 'package:smartfarm/view/screen/category_home/edit_profile_screen.dart';
import 'package:smartfarm/view/screen/category_home/motors_screen.dart';
import 'package:smartfarm/view/screen/category_home/sensor_screen.dart';
import 'package:smartfarm/view/screen/category_home/setting_screen.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:smartfarm/view_model/cubit/realtime_socket_cubit/soket_cubit.dart';
import 'package:smartfarm/view_model/cubit/sensor_controller.dart';
Widget drawerListTile(context) {
  final sensorController = Get.find<SensorController>();

  return Drawer(
      child: ListView(
    children: [
      DrawerHeader(
          padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(right: 15, left: 10),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Icon(Icons.person, size: 80, color: Colors.black38),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 1,
                        blurRadius: 5),
                  ],
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return TextUtils(
                          text:
                              "${AuthCubit.get(context).userData['data']['fullName']}",
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Container(
                          width: 160,
                          child: TextUtils(
                            text:
                                '${AuthCubit.get(context).userData['data']['email']}',
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                          ));
                    },
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Container(
                          width: 160,
                          child: TextUtils(
                            text: '${AuthCubit.get(context).userData['role']}',
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                          ));
                    },
                  ),
                ],
              ),
            ]),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.85),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    blurRadius: 5),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
              ),
            ),
          )),
      BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return listTileDrawer(context, title: 'Home Screen', onTap: () {

            Navigator.pop(context);
          });
        },
      ),
      listTileDrawer(context, title: 'Sensor', onTap: () {
            Navigator.pop(context);
            sensorController.sensors();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SensorScreen(),

            ));
          }),
      listTileDrawer(context, title: 'Mototrs', onTap: () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MotorsScreen()));
      }),
      listTileDrawer(context, title: 'Edit Profile', onTap: () {
        print('Edit Profile');

        Navigator.pop(context);
        AuthCubit.get(context).showData();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => EditProfileScreen()),
        );
      }),
      listTileDrawer(context, title: 'Add Worker', onTap: () {
        print('Add Worker');
        Navigator.pop(context);
        AuthCubit.get(context).ctrlPassword.text = '';
        AuthCubit.get(context).ctrlEmail.text = '';
        AuthCubit.get(context).ctrlName.text = '';
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AddWorkerScreen()));
      }),
      listTileDrawer(context, title: 'Setting', onTap: () {
        print('Setting');
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const SettingScreen()),
        );
      }),
      listTileDrawer(context, title: 'Log Out', onTap: () async {
       await AuthCubit.get(context).logOut(context);
      }),
    ],
  ));
}
