import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/models/dartmodel/getsponshermodel.dart';
import 'package:http/http.dart' as http;

class AdminSponsherScreen extends StatefulWidget {
  const AdminSponsherScreen({super.key});

  @override
  State<AdminSponsherScreen> createState() => _AdminSponsherScreenState();
}

class _AdminSponsherScreenState extends State<AdminSponsherScreen> {
  List<Getsponshernow> fetchsponsherlist = [];

  Future<List<Getsponshernow>> fetchSponsher() async {
    final getResponse =
        await http.get(Uri.parse("http://192.168.43.195:5444/get-sponsher"));

    if (getResponse.statusCode == 200) {
      print(getResponse.body);
      var data = jsonDecode(getResponse.body.toString());

      for (Map<String, dynamic> i in data) {
        fetchsponsherlist.add(Getsponshernow.fromJson(i));

        return fetchsponsherlist;
      }
    } else {
      return fetchsponsherlist;
    }
    return fetchsponsherlist;
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
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: fetchSponsher(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: fetchsponsherlist.length,
                      itemBuilder: (context, index) {
                        return Container(
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
                                        fetchsponsherlist[index]
                                            .eventname
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        fetchsponsherlist[index]
                                            .organizationname,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        fetchsponsherlist[index].address,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        fetchsponsherlist[index].eventdate,
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
                                          fetchsponsherlist[index].audince,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          fetchsponsherlist[index].description,
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
