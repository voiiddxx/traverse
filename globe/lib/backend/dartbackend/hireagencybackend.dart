import 'package:flutter/material.dart';
import 'package:globe/backend/models/dartmodel/hiremodel.dart';
import 'package:globe/utils/snack.dart';
import 'package:http/http.dart' as http;

class hireService {
  void hirenow(
      {required BuildContext context,
      required String name,
      required String email,
      required String mobilenumber,
      required String product,
      required String productcategory}) async {
    hireUser hireuser = hireUser(
        name: name,
        email: email,
        mobilenumber: mobilenumber,
        product: product,
        productcategory: productcategory);

    http.Response res = await http.post(
        Uri.parse("http://192.168.43.195:5444/hire"),
        body: hireuser.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    print(res.body);

    if (res.statusCode == 200) {
      showSnackBar("Request Sent", context);
    } else {
      showSnackBar("some Error", context);
    }
  }
}
