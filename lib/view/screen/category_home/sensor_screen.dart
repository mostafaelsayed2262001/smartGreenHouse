import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/sensor_widget/row_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view_model/cubit/realtime_socket_cubit/soket_cubit.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<SocketCubit>(context).delete();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        title: TextUtils(
          text: 'Sensors',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset(
              'images/sensor.png',
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
            ),
          ),
          rowCustomWidget(name: 'Ultra Sonic', num: '20 cm'),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          rowCustomWidget(name: 'Flame', num: '50 C'),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          rowCustomWidget(name: 'Humidity  ', num: '50 C'),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          BlocConsumer<SocketCubit, SocketState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return rowCustomWidget(name: 'Soil Moisture', num: "${BlocProvider.of<SocketCubit>(context).socketTest()}");
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          rowCustomWidget(name: 'Light', num: 'on'),
        ]),
      ),
    );
  }
}
