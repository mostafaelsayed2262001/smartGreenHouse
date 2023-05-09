import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartfarm/services/network/sensor_io.dart';

part 'soket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketInitial());
  var x;
  SensorRealTime sensorRealTime=SensorRealTime();
  socketTest(){

     x=sensorRealTime.sokectConnect('pump');
    emit(SocketTest());

  }
  delete(){

    sensorRealTime.socketDisconnect();
    emit(SocketInitial());
    print('objectdddsssss');

  }
}
