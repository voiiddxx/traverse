import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/frontend/adminfrontend/addagency.dart';
import 'package:globe/frontend/adminfrontend/adminsponsher.dart';
import 'package:globe/frontend/adminfrontend/seehired.dart';
import 'package:http/http.dart' as http;
import '../../backend/models/dartmodel/getsponshermodel.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.workspaces_outlined,
          color: Colors.black,
          size: 18,
        ),
        actions: [
          Icon(
            Icons.login_outlined,
            color: Colors.black,
            size: 18,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        titleSpacing: 1,
        title: Text(
          "Traverse",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 252, 252, 252),
              Color.fromARGB(255, 233, 229, 229),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              Text(
                "Welcome Agency Pannel",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.sort,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 74, 74, 74),
                          ),
                          enabled: false,
                          filled: true,
                          fillColor: Color.fromARGB(255, 223, 223, 223),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Services",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        //==================sposhorship circle 1============//
                        InkWell(
                          onTap: changetosponsher,
                          child: Container(
                            height: 80,
                            width: 80,
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.attach_money_rounded,
                                  size: 45,
                                  color: Colors.black,
                                )),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 194, 194, 194),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sponshorship",
                          style: TextStyle(
                              color: Color.fromARGB(255, 50, 50, 50),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    //==================add Agency=========//
                    InkWell(
                      onTap: changetoadd,
                      child: Column(
                        children: [
                          //==================sposhorship circle 1============//
                          Container(
                            height: 80,
                            width: 80,
                            child: Icon(
                              Icons.blinds_outlined,
                              color: Color.fromARGB(255, 47, 47, 47),
                              size: 45,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 194, 194, 194),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Add Agency",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    //================see responses ==================//
                    Column(
                      children: [
                        //==================sposhorship circle 1============//
                        InkWell(
                          onTap: changeto,
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Icon(
                              Icons.call_missed_sharp,
                              color: Colors.black,
                              size: 45,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 194, 194, 194),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Responses",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),

                    SizedBox(
                      width: 20,
                    ),
                    //===================others=============================//
                    Column(
                      children: [
                        //==================sposhorship circle 1============//
                        Container(
                          height: 80,
                          width: 80,
                          child: Icon(
                            Icons.bubble_chart,
                            color: Colors.black,
                            size: 40,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 194, 194, 194),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Others",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Checkout All Sponshorship Requirementrs",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
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
                                            fetchsponsherlist[index]
                                                .description,
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
      ),
    );
  }

  void changetoadd() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddAgencyScreen();
    }));
  }

  void changetosponsher() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminSponsherScreen();
    }));
  }

  void changeto() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SeeHiredSCreen();
    }));
  }
}
