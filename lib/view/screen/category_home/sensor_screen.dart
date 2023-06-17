import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/sensor_widget/row_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view_model/cubit/sensor_controller.dart';

class SensorScreen extends StatelessWidget {
  final controller = Get.find<SensorController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {
            // BlocProvider.of<SocketCubit>(context).delete();
            controller.delete();
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
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          Obx(() => rowCustomWidget(
              name: 'Temperature',
              num: "${controller.fanValue.isEmpty ? false :
              controller.tempValue[0]
              }")),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),Obx(() => rowCustomWidget(
              name: 'Humidity',
              num: "${controller.fanValue.isEmpty ? false :
              controller.humidityValue[0]
              }")),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),

          Obx(() => rowCustomWidget(
              name: 'Fan Status',
              num: "${controller.fanValue.isEmpty ? false :
              controller.fanValue[0] == 1 ? 'on' : "off"
              }")),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Obx(() => rowCustomWidget(
              name: 'Pump Status',
              num: "${controller.soilValue.isEmpty ? false :
                  controller.pumpValue[0] == 1 ? 'on' : "off"
                }")),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Obx(() => rowCustomWidget(
              name: 'Soil Moisture',
              num:
                  "${controller.soilValue.value.isEmpty ? false : controller.soilValue[0]}")),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Obx(() => rowCustomWidget(
              name: 'Light',
              num:
              "${controller.lDRValue.value.isEmpty ? false :
                  controller.lDRValue[0]==1?"on":"off"
                }")),


        ]),
      ),
    );
  }
}
