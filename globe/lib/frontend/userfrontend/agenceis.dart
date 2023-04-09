import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../backend/models/dartmodel/getagencymodel.dart';

class AllAgenceis extends StatefulWidget {
  const AllAgenceis({super.key});

  @override
  State<AllAgenceis> createState() => _AllAgenceisState();
}

class _AllAgenceisState extends State<AllAgenceis> {
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 59, 59),
        elevation: 0,
        title: Text(
          "Traverse",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 1,
        actions: [
          Icon(
            Icons.logout_rounded,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: Icon(
          Icons.workspaces_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Column(
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
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 20, right: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        agencylist[index].agencyname,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        agencylist[index].registrationnumber,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        agencylist[index].agencyaddress,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        agencylist[index].agencyspan,
                                        style: TextStyle(
                                            color: Colors.white,
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
                                              color: Colors.white,
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
                                                backgroundColor: Color.fromARGB(
                                                    255, 78, 77, 77),
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
                              color: Color.fromARGB(255, 46, 46, 46),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
