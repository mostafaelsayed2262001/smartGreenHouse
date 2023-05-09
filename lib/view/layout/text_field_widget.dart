import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';

class TextFieldWidgt extends StatelessWidget {
  TextFieldWidgt(
      {required this.lable,required this.validator,required this.ctrl,this.obscureText = false,this.keyboardType = TextInputType.text,required this.iconData,required this.suffix,
      Key? key})
      : super(key: key);
  TextEditingController ctrl = TextEditingController();
  String? Function(String?)? validator;
  String lable;
  bool obscureText;
  TextInputType keyboardType;
  IconData iconData;
  Widget suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      controller: ctrl,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: Icon(iconData),
        hintStyle: GoogleFonts.roboto(
            color: HexColor('#838383'),
            fontSize: MediaQuery.of(context).size.aspectRatio * 35),
        label: TextUtils(
          text: lable,
          color: kCOlor,
          fontSize: MediaQuery.of(context).size.aspectRatio * 35,
        ),
      ),
    );
  }
}
