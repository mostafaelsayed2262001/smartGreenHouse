import 'package:flutter/material.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

Widget listTileDrawer(context,
    {required String title, required void Function()? onTap}) {
  return ListTile(
    title: TextUtils(text: title, color: Colors.black87),
    trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey),
    onTap: onTap,
  );
}
