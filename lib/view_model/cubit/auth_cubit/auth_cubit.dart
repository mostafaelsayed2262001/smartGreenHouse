import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartfarm/services/network/auth_services.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/auth/login_screen.dart';
import 'package:smartfarm/view/screen/category_home/home_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthenticationServices _authenticationServices = AuthenticationServices();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  TextEditingController ctrlName = TextEditingController();
  late String token;
  var userData;

  static AuthCubit get(context) => BlocProvider.of(context);
  bool visibilty = true;

//done
  login(context) async {
    emit(AuthLoader());
    token = await _authenticationServices.postLogin(
        user: ctrlEmail.text.toString(),
        password: ctrlPassword.text.toString());

    if (token != 'false') {
      await showData();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) =>  HomeScreen()),
      );
      emit(AuthLogin());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: const TextUtils(
          text: 'Invalid Password Or Email',
          color: Colors.white,
        ),
        backgroundColor: (Colors.grey),
      ));
      emit(AuthInitial());
    }
  }

//to show data when u have token
  showData() async {
    await _authenticationServices.showData(token);
    userData = await _authenticationServices.showData(token);
    ctrlName.text = userData['data']['fullName'];
    emit(AuthDataShowed());
  }

  logOut(context) async {
    var x = await _authenticationServices.postLogout(token);
    if (x == 200) {
      ctrlEmail = TextEditingController();
      ctrlPassword = TextEditingController();
      ctrlName = TextEditingController();
      AuthCubit();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => LogInScreen()),
      );
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: const TextUtils(
          text: 'Invalid LogOut',
          color: Colors.white,
        ),
        backgroundColor: (Colors.grey),
      ));
  }

  updateData(context) async {
    var status;
    try {
      status = await _authenticationServices.updateData(
          fullName: ctrlName.text.toString().trim(),
          password: ctrlPassword.text.toString().trim(),
          token: token);
    } catch (e) {
      print('$e');
    }
    if (status == 200) {
      await showData();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextUtils(text: 'Done ✔', fontWeight: FontWeight.bold),
            content: TextUtils(
                text: 'Your Data is Updated 😊.',
                fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                color: Colors.black),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: TextUtils(
                    text: 'OK',
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      );
    }
  }

  AddWorker(context) async {
    var status;
    try {
      status = await _authenticationServices.addWorker(
          email: ctrlEmail.text.toString().trim(),
          fullName: ctrlName.text.toString().trim(),
          password: ctrlPassword.text.toString().trim(),
          token: token);
    } catch (e) {
      print('$e');
    }
    if (status == 200) {
      await showData();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextUtils(text: 'Done ✔', fontWeight: FontWeight.bold),
            content: TextUtils(
                text: 'Your Data is Updated 😊.',
                fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                color: Colors.black),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: TextUtils(
                    text: 'OK',
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      );
    }
  }

  isVisiable() {
    visibilty = !visibilty;
    emit(AuthVisiable());
  }
}
