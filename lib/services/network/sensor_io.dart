import 'package:socket_io_client/socket_io_client.dart' as IO;

class SensorRealTime {
  final socket = IO.io('http://192.168.58.198:5000/', <String, dynamic>{
  'autoConnect': false,
  'transports': ['websocket'],
});
   sokectConnect(String nameSensor) {

    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.on('$nameSensor', (data) {

      var x = data["soilValue"];
      print("Soil Value: $x");
      return x;
    });
  }
  socketDisconnect(){
    socket.onDisconnect((_) => print('Connection Disconnection'));
  }
}
