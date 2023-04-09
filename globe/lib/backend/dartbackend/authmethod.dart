import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/snack.dart';
import '../models/dartmodel/loginmodel.dart';
import '../models/dartmodel/registermodel.dart';

class AuthService {
  void Register(
      {required BuildContext context,
      required String username,
      required String email,
      required String password,
      required String confirmpassword}) async {
    try {
      RegisterUser registerUser = RegisterUser(
          username: username,
          email: email,
          password: password,
          confirmpassword: confirmpassword,
          token: '',
          id: '');

      http.Response res = await http.post(
          Uri.parse("http://192.168.43.195:5444/register"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: registerUser.toJson());

      if (res.statusCode == 200) {
        showSnackBar("Account Created", context);
      } else {
        showSnackBar("Some Error Occured", context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  //===========login route================//
  void login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      Loginuser loginuser = Loginuser(email: email, password: password);

      http.Response loginResponse = await http.post(
          Uri.parse("http://192.168.43.195:5444/login"),
          body: loginuser.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      if (loginResponse.statusCode == 200) {
        showSnackBar("Account Login Successfully", context);
      } else {
        showSnackBar("there is some error occured", context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}
