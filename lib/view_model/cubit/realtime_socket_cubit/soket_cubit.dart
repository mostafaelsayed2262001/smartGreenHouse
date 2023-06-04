// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:smartfarm/services/network/sensor_io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// part 'soket_state.dart';
//
// class SocketCubit extends Cubit<SocketState> {
//   SocketCubit() : super(SocketInitial());
//
// List x=[];
//   SensorRealTime sensorRealTime=SensorRealTime();
//
//   socketTest(){
//     emit(SocketLoading());
//
//       final socket = IO.io('http://192.168.58.198:5000/', <String, dynamic>{
//         'autoConnect': false,
//         'transports': ['websocket'],
//       });
//       socket.connect();
//       socket.onConnect((_) {
//         print('Connection established');
//       });
//       socket.on('pump', (data) {
//
//
//
//         print("Soil Value in Cubit: ${data["soilValue"]}");
//         x.add(data["soilValue"]);
//         print('x=$x');
//
//       });
//
//     // print( sensorRealTime.socketConnect('pump'));
//     emit(SocketTest());
//
//
//     // socketTest()async{
//     //   sensorRealTime.socketConnect('pump');
//     //   print( sensorRealTime.socketConnect('pump'));
//
//   }
//   delete(){
//
//     sensorRealTime.socketDisconnect();
//     emit(SocketInitial());
//     print('objectdddsssss');
//
//   }
// }
