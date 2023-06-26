import 'package:get/get.dart';
import 'package:smartfarm/services/network/sensor_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SensorController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  RxList soilValue = [].obs;
  RxList pumpValue = [].obs;
  RxList lDRValue = [].obs;
  RxList fanValue = [].obs;
  RxList tempValue = [].obs;
  RxList humidityValue = [].obs;
  final socket = IO.io('http://192.168.75.198:5000/', <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });

  lDRSensors() {
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on('lighting', (data) {
      lDRValue.value = [data["lighting"]];
      // pumpValue.value=[data["pump"]];
      print('x=${soilValue.length}');
    });
  }

  pumpSensors() {
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on('pump', (data) {
      soilValue.value = [data["soilValue"]];
      pumpValue.value=[data["pump"]];
      print('x=${soilValue.length}');
    });
  }

  fanSensors() {
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on('fan', (data) {
      fanValue.value = [data["fanStatus"]];
      tempValue.value = [data["temp"]];
      humidityValue.value = [data["humidity"]];
      print('x=${fanValue.length}');
    });
  }

  delete() {
    socket.disconnect();
  }
}
