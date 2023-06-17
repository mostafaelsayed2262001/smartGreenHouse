import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartfarm/utils/my_string.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';
import 'package:smartfarm/view/screen/category_home/home_screen.dart';

class AuthenticationServices {
  var client = http.Client();

  //Finished
  Future<String> postLogin(
      {required String user, required String password}) async {
    try {
      var response =
          await client.post(Uri.parse(baseUrl + 'api/users/auth/login'),
              body: jsonEncode(
                {"email": "$user", "password": "$password"},
              ),
              headers: {"content-type": "application/json; charset=utf-8"});

      var responseJson = jsonDecode(response.body);

      return responseJson['token'];
    } catch (e) {
      return 'false';
    }
  }

  postLogout(token) async {
    var response = await client
        .post(Uri.parse(baseUrl + 'api/users/auth/logout'), headers: {
      "content-type": "application/json",
      'Authorization': 'Bearer $token',
    });
    var responseJson = jsonDecode(response.body);
    print(response.statusCode);
    return responseJson['status'];
  }

  //forget will send email - done
  postForget({required String email}) async {
    print(email);
    var response =
        await client.post(Uri.parse(baseUrl + 'api/users/auth/forgot-password'),
            body: jsonEncode(
              {"email": "$email"},
            ),
            headers: {"content-type": "application/json; charset=utf-8"});
    var responseJson = jsonDecode(response.body);
    print(responseJson['message']);
    return responseJson;
  }

//reset password will send code and check if true or false
  postReset({required String code, required String password}) async {
    var response = await client.post(
        Uri.parse(baseUrl + 'api/users/auth/password-reset'),
        body: jsonEncode({"code": code, "password": password}),
        headers: {"content-type": "application/json; charset=utf-8"});
    var responseJson = jsonDecode(response.body);

    return responseJson;
  }

//done
  showData(token) async {
    var response =
        await client.get(Uri.parse(baseUrl + 'api/users/auth/show'), headers: {
      "content-type": "application/json",
      'Authorization': 'Bearer $token',
    });
    var responseJson = jsonDecode(response.body);

    return responseJson;
  }

  updateData(
      {required String fullName,
      required String password,
      required String token}) async {
    var response = await client.post(
        Uri.parse(baseUrl + 'api/users/auth/update'),
        body: jsonEncode({"fullName": "$fullName", "password": password}),
        headers: {
          "content-type": "application/json; charset=utf-8",
          'Authorization': 'Bearer $token',
        });
    var responseJson = jsonDecode(response.body);
    print("${responseJson['status']}");
    return responseJson['status'];
  }

  addWorker(
      {required String fullName,
      required String password,
      required String email,
      required String token}) async {
    print(token);
    var response = await client.post(
      Uri.parse(baseUrl + 'api/users/auth/signup'),
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "fullName": fullName,
        "email": email,
        "password": password,
      }),
    );

    var responseJson = jsonDecode(response.body);

    return responseJson['status'];
  }

  //machines
  tempMachine(index) async {
    try {
      var response = await client
          .get(Uri.parse(baseUrl + 'api/dht?temp=$index'), headers: {
        "content-type": "application/json",
      });
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } on Exception catch (e) {
      throw Exception(e);
      // TODO
    }
  }

  garageMachine(token) async {
    print(token);
    try {
      var response = await client.post(
        Uri.parse(baseUrl + 'api/garage/turn-on-garage-servo'),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );

      var responseJson = jsonDecode(response.body);
      if (responseJson['status'] == 200) {
        return responseJson['status'];
      } else if (responseJson['status'] == 400) {
        await garageOffMachine(token);
      }
    } on Exception catch (e) {
      throw Exception(e);
      // TODO
    }
  }

  garageOffMachine(token) async {
    print(token);
    var response = await client.post(
      Uri.parse(baseUrl + 'api/garage/turn-off-garage-servo'),
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    var responseJson = jsonDecode(response.body);
    if (responseJson['status'] == 200) {
      return responseJson['status'];
    } else if (responseJson['status'] == 400) {}
  }
}
