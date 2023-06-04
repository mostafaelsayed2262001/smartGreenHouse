import 'package:smartfarm/view_model/cubit/realtime_socket_cubit/soket_cubit.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SensorRealTime {
  final socket = IO.io('http://192.168.58.198:5000/', <String, dynamic>{
  'autoConnect': false,
  'transports': ['websocket'],
});

   socketConnect(String nameSensor) {

    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on('$nameSensor', (data) {
      print("Soil Value: ${data["soilValue"]}");


      print("Soil Value: ${data["soilValue"]}");
      return data;
    });
  }
  socketDisconnect(){
    socket.disconnect();
  }
}
