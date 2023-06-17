import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartfarm/observer.dart';
import 'package:flutter/material.dart';

import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/screen/onboard/onBoardScreen.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:smartfarm/view_model/cubit/realtime_socket_cubit/soket_cubit.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: ((context) =>AuthCubit())),
      // BlocProvider(create: ((context) =>SocketCubit())),
    ], child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Farm ',
      theme: ThemesApp.light,
      home: const OnBoardingPage(),
    ),);
  }
}
