import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_field_widget.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/category_home/home_screen.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';

class AddWorkerScreen extends StatelessWidget {
  AddWorkerScreen({Key? key}) : super(key: key);
  final ctrl = TextEditingController();
  final keyWorker = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: TextUtils(
            text: 'Add Worker',
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.aspectRatio * 40,
            fontWeight: FontWeight.w500,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.05, vertical: mq.height * 0.01),
          child: Form(
            key: keyWorker,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: mq.height * 0.23,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.black38,
                        size: mq.height * 0.2,
                      ),
                    )),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return TextFormField(
                      controller: AuthCubit.get(context).ctrlName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Full Name';
                        }
                        else if (value.length<=6){
                          return 'Name should have 6 character at least ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainColor)),
                        hintStyle: GoogleFonts.roboto(
                            color: HexColor('#838383'), fontSize: 20),
                        label: TextUtils(
                          text: 'Full Name',
                          color: kCOlor,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return TextFormField(
                      controller: AuthCubit.get(context).ctrlEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+')
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainColor)),
                        hintStyle: GoogleFonts.roboto(
                            color: HexColor('#838383'), fontSize: 20),
                        label: TextUtils(
                          text: 'E-Mail',
                          color: kCOlor,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return TextFormField(
                      controller: AuthCubit.get(context).ctrlPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Password';
                        }
                        else if (value.length<=6){
                          return 'Password should have 6 character at least ';
                        }
                        return null;
                      },
                      obscuringCharacter: '*',
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainColor)),
                        hintStyle: GoogleFonts.roboto(
                            color: HexColor('#838383'), fontSize: 20),
                        label: TextUtils(
                          text: 'Password',
                          color: kCOlor,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mq.height * 0.07,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(mainColor),
                    ),
                    onPressed: () async{
                      if(keyWorker.currentState!.validate()){

                       await AuthCubit.get(context).AddWorker(context);
                      }

                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: TextUtils(
                        text: 'Save',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
