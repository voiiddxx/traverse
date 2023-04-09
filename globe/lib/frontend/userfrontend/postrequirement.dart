import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/dartbackend/sponsherservide.dart';

class PostSponsherScreen extends StatefulWidget {
  const PostSponsherScreen({super.key});

  @override
  State<PostSponsherScreen> createState() => _PostSponsherScreenState();
}

class _PostSponsherScreenState extends State<PostSponsherScreen> {
  final TextEditingController organisationname = TextEditingController();
  final TextEditingController eventname = TextEditingController();
  final TextEditingController eventdate = TextEditingController();
  final TextEditingController venue = TextEditingController();
  final TextEditingController eventaddress = TextEditingController();
  final TextEditingController audince = TextEditingController();
  final TextEditingController description = TextEditingController();
  final SponsherService sponsherService = SponsherService();

  void postNow() {
    SponsherService().addSponsher(
        context: context,
        organisationname: organisationname.text,
        venue: venue.text,
        eventname: eventname.text,
        description: description.text,
        audince: audince.text,
        eventdate: eventdate.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 255, 27, 84),
              Color.fromARGB(255, 255, 29, 29),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Post The Sponshorship Requirement",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: organisationname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Your Organization Name",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Orhanization Name: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: eventname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Your Password",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Event Name: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: eventdate,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Your Password",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Event Date: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: venue,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: "Event Venue",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Venue: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: description,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Your Password",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Event Description ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: audince,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Your Password",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Audince: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 249, 249))),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: postNow,
                      child: Text(
                        "Post Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
