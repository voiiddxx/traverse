import 'dart:io';
import 'package:globe/frontend/adminfrontend/getagency.dart';
import 'package:globe/utils/snack.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:globe/backend/models/dartmodel/addagencymodel.dart';

class AgencyService {
  void addAgency(
      {required BuildContext context,
      required String agencyname,
      required String registrationnumber,
      required String agencyspan,
      required String agencyaddress,
      required String remarkablework}) async {
    final AddAgency addAgency = AddAgency(
      agencyname: agencyname,
      agencyaddress: agencyaddress,
      agencyspan: agencyspan,
      registrationnumber: registrationnumber,
      remarkablework: remarkablework,
    );
    http.Response agencyResponse = await http.post(
        Uri.parse("http://192.168.43.195:5444/upload-agency"),
        body: addAgency.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    print(agencyResponse.body);

    if (agencyResponse.statusCode == 200) {
      showSnackBar("Agency Uploaded", context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GetAgencyScreen();
      }));
    } else {
      showSnackBar("Some Error Happend", context);
    }
  }
}
