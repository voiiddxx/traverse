import 'dart:convert';
import 'package:globe/frontend/userfrontend/agenceis.dart';
import 'package:globe/frontend/userfrontend/hire.dart';
import 'package:globe/frontend/userfrontend/sposnhor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../backend/models/dartmodel/getagencymodel.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
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
      body: Container(
        color: Color.fromARGB(255, 59, 59, 59),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white70,
                            size: 22,
                          ),
                          label: Text(
                            "Search",
                            style: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 193),
                                fontWeight: FontWeight.bold),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 93, 93, 93),
                          enabled: false),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Services",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: Changetoagencies,
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Icon(
                              Icons.stacked_line_chart_rounded,
                              color: Colors.white70,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Ageniceis",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),

                    //=============sponshorship===============//
                    Column(
                      children: [
                        InkWell(
                          onTap: changetosponshor,
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Icon(
                              Icons.blur_on,
                              color: Colors.white70,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Sponshorship",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: Icon(
                            Icons.waving_hand_outlined,
                            color: Colors.white70,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Responses",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: Icon(
                            Icons.handshake,
                            color: Colors.white70,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Other",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Image.asset("assets/images/add.jpg"),
              SizedBox(
                height: 25,
              ),
              Text(
                "Advertisement Agenceis",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 20, right: 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
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
                                            agencylist[index]
                                                .registrationnumber,
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
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 78, 77, 77),
                                                    elevation: 0),
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return HireAgencyScreen();
                                                  }));
                                                },
                                                child: Text("Contact Now")),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/get.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void Changetoagencies() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AllAgenceis();
    }));
  }

  void changetosponshor() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SponshorScreen();
    }));
  }
}
