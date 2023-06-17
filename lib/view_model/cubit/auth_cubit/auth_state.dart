part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthVisiable extends AuthState {}
class AuthLogin extends AuthState {}
class AuthError extends AuthState {}
class AuthLoader extends AuthState {}
class AuthDataShowed extends AuthState {}
class MachineTemperature extends AuthState {}
class MachineGarage extends AuthState {}
