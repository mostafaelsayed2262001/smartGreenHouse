import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/drawer_widget/drawer_listTile_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/category_home/motors_screen.dart';
import 'package:smartfarm/view/screen/category_home/sensor_screen.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:smartfarm/view_model/cubit/realtime_socket_cubit/soket_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider<SocketCubit>(
      create: (context) => SocketCubit(),
      child: SafeArea(
        child: Scaffold(
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
                        fontSize: MediaQuery.of(context).size.aspectRatio * 40,
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
                      BlocProvider.of<SocketCubit>(context).socketTest();

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
                Expanded(
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
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
