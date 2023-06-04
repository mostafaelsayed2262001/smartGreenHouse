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
  final socket = IO.io('http://192.168.58.198:5000/', <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });

  sensors() {
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

  delete() {

    socket.disconnect();
  }
}
