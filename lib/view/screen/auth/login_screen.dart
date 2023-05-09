import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartfarm/services/network/auth_services.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/layout/text_field_widget.dart';
import 'package:smartfarm/view/screen/auth/forget_screen.dart';
import 'package:smartfarm/view/screen/category_home/home_screen.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view_model/cubit/auth_cubit/auth_cubit.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  final keyAuth = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mqw = MediaQuery.of(context).size.width;
    var mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: mqw * 0.1,
          ),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: mqh * 0.2,
                    ),
                    Container(
                      height: mqh * 0.25,
                      child: Image.asset('images/auth/login.jpg'),
                    ),
                    SizedBox(
                      height: mqh * 0.03,
                    ),
                    Form(
                      key: keyAuth,
                      child: Column(
                        children: [
                          TextFieldWidgt(
                              suffix: SizedBox(),
                              iconData: Icons.email_outlined,
                              lable: 'Please enter your email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'\S+@\S+\.\S+')
                                    .hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              ctrl: AuthCubit.get(context).ctrlEmail,
                              keyboardType: TextInputType.emailAddress),
                          SizedBox(
                            height: mqh * 0.015,
                          ),
                          TextFieldWidgt(
                              obscureText: BlocProvider.of<AuthCubit>(context)
                                  .visibilty,
                              suffix: BlocListener<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                child: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthCubit>(context)
                                          .isVisiable();
                                    },
                                    icon: BlocProvider.of<AuthCubit>(context)
                                            .visibilty
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )),
                              ),
                              iconData: Icons.lock,
                              lable: 'Enter your password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              ctrl: AuthCubit.get(context).ctrlPassword,
                              keyboardType: TextInputType.text),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.001,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => ForgetPasswordScreen()),
                          );
                        },
                        child: TextUtils(
                          text: 'Forget Password',
                          color: kCOlor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.07,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor),
                          ),
                          onPressed: () async {
                            if (keyAuth.currentState!.validate()) {
                              await AuthCubit.get(context).login(context);

                            }
                          },
                          child: BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              // TODO: implement listener

                            },
                            builder: (context, state) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(15)),
                                child: TextUtils(
                                  text: 'Login',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            },
                          )),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
