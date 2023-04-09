import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/models/dartmodel/gethiredmodel.dart';
import 'package:http/http.dart' as http;

class SeeHiredSCreen extends StatefulWidget {
  const SeeHiredSCreen({super.key});

  @override
  State<SeeHiredSCreen> createState() => _SeeHiredSCreenState();
}

class _SeeHiredSCreenState extends State<SeeHiredSCreen> {
  List<Gethired> gitehiredlist = [];
  Future<List<Gethired>> fetchHired() async {
    final response =
        await http.get(Uri.parse("http://192.168.43.195:5444/get"));

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      for (Map<String, dynamic> i in data) {
        gitehiredlist.add(Gethired.fromJson(i));
      }
      return gitehiredlist;
    } else {
      return gitehiredlist;
    }
    return gitehiredlist;
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: fetchHired(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: gitehiredlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 187, 187, 187),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 100,
                                color: Color.fromARGB(255, 26, 26, 26),
                                child: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 150,
                                color: Colors.white70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Text(
                                        gitehiredlist[index].name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5),
                                      child: Text(
                                        gitehiredlist[index].email,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 7),
                                      child: Text(
                                        "83154215352",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Text(
                                        gitehiredlist[index].product,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 10),
                                      child: Text(
                                        gitehiredlist[index].productcategory,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
