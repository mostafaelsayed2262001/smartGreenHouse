import 'package:flutter/material.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

Widget rowCustomWidget({required String name ,required String num ,}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      Expanded(flex:1,child: TextUtils(text: '$name:', color: Colors.black,)),
      Expanded(flex:1,child: TextUtils(text: num,color: Colors.black,))
    ],),
  );
}