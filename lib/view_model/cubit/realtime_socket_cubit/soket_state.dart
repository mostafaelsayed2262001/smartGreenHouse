part of 'soket_cubit.dart';

@immutable
abstract class SocketState {}

class SocketInitial extends SocketState {}
class SocketTest extends SocketState {}
class SocketClosed extends SocketState {}
