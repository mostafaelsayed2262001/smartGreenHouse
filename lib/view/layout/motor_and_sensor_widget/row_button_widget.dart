import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
Widget RowButtonWidget(BuildContext context,
    {required void Function()? onTap,required IconData icon,required String title,required String status}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1,
                blurRadius: 5),]),
      height: MediaQuery.of(context).size.height * 0.17,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          icon,
          size: 80,
          color: Colors.black87,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  color: Colors.black87,
                  fontSize: MediaQuery.of(context).size.width*0.05,
                  fontWeight: FontWeight.w500,
                ),

                TextUtils(
                  text: status,
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.width*0.045,
                ),
              ],
            ))
      ]),
    ),
  );
}
