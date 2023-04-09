import 'package:flutter/material.dart';
import 'package:globe/backend/dartbackend/postsponsher.dart';
import 'package:globe/utils/snack.dart';
import 'package:http/http.dart' as http;

class SponsherService {
  void addSponsher({
    required BuildContext context,
    required String organisationname,
    required String venue,
    required String eventname,
    required String description,
    required String audince,
    required String eventdate,
  }) async {
    sponsherUser sponsheruser = sponsherUser(
        organisationname: organisationname,
        eventname: eventname,
        venue: venue,
        eventdate: eventdate,
        description: description,
        audince: audince);
    http.Response sponsherResponse = await http.post(
        Uri.parse("http://192.168.43.195:5444/add-requirement"),
        body: sponsheruser.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    print(sponsherResponse.body);

    if (sponsherResponse.statusCode == 200) {
      showSnackBar("Requirement Posted Successfully", context);
    } else {
      print("There Is Some Error Occured");
      showSnackBar("Some Error Occured", context);
    }
  }
}
