import 'package:bloc/bloc.dart';
import 'package:smartfarm/observer.dart';
import 'package:flutter/material.dart';

import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/screen/onboard/onBoardScreen.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Farm ',
      theme: ThemesApp.light,
      home: const OnBoardingPage(),
    );
  }
}
