import 'package:flutter/material.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TextUtils(text: 'Home Screen')
        ),
        
      ),
    );
  }
}
