import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/models/dartmodel/getagencymodel.dart';
import 'package:http/http.dart' as http;

class GetAgencyScreen extends StatefulWidget {
  const GetAgencyScreen({super.key});

  @override
  State<GetAgencyScreen> createState() => _GetAgencyScreenState();
}

class _GetAgencyScreenState extends State<GetAgencyScreen> {
  List<Getagency> agencylist = [];

  Future<List<Getagency>> fetchAgency() async {
    final response =
        await http.get(Uri.parse("http://192.168.43.195:5444/get-agency"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      for (Map<String, dynamic> i in data) {
        agencylist.add(Getagency.fromJson(i));
      }
      return agencylist;
    }
    return agencylist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: fetchAgency(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: agencylist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 20, right: 10),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          agencylist[index].agencyname,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          agencylist[index].registrationnumber,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          agencylist[index].agencyaddress,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          agencylist[index].agencyspan,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            agencylist[index]
                                                .remarkablework
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 35,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                  elevation: 0),
                                              onPressed: () {},
                                              child: Text("Contact Now")),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/get.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 229, 226, 226),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
