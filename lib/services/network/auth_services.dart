import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartfarm/utils/my_string.dart';

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

  updateData({required String fullName,required String password,required String token}) async {
    var response = await client.post(
        Uri.parse(baseUrl + 'api/users/auth/update'),
        body: jsonEncode({"fullName": "$fullName", "password": password}),
        headers: {
          "content-type": "application/json; charset=utf-8",
          'Authorization': 'Bearer $token',
        });
    var responseJson = jsonDecode(response.body);
    print(responseJson);
    return responseJson['status'];
  }

  addWorker(
      {required String fullName,
      required String password,
      required String email,
      required String token}) async {
    var response =
        await client.post(Uri.parse(baseUrl + 'api/users/auth/signup'),
            body: jsonEncode({
              "fullName": fullName,
              "password": password,
              "email": email,
            }),
            headers: {
          "content-type": "application/json; charset=utf-8",
          'Authorization': 'Bearer $token',
        });
    var responseJson = jsonDecode(response.body);


    return responseJson['status'];
  }
}
