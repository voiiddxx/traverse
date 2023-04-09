import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:globe/backend/dartbackend/agencybackend.dart';

class AddAgencyScreen extends StatefulWidget {
  const AddAgencyScreen({super.key});

  @override
  State<AddAgencyScreen> createState() => _AddAgencyScreenState();
}

class _AddAgencyScreenState extends State<AddAgencyScreen> {
  FilePickerResult? result;
  PlatformFile? pickedfile;
  String? filename;
  File? filetodisplay;

  final TextEditingController agencyname = TextEditingController();
  final TextEditingController agencyspan = TextEditingController();
  final TextEditingController registrationnumber = TextEditingController();
  final TextEditingController agencyaddress = TextEditingController();
  final TextEditingController remarkablework = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    agencyname.dispose();
    agencyspan.dispose();
    agencyaddress.dispose();
    registrationnumber.dispose();
    remarkablework.dispose();
  }

  void UploadNow() {
    AgencyService().addAgency(
        context: context,
        agencyname: agencyname.text,
        registrationnumber: registrationnumber.text,
        agencyspan: agencyspan.text,
        agencyaddress: agencyaddress.text,
        remarkablework: remarkablework.text);
    print("worked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 255, 119, 158),
              Color.fromARGB(255, 253, 68, 68),
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  "Upload Your Advertisement Agency Now",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                    controller: agencyname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Enter Agency Name",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Agency Name: ",
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

                //===========agency registration number==========//
                TextField(
                    controller: registrationnumber,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Aency Registration Number",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Registration Numbet",
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

                //===========agency address===============//
                TextField(
                    controller: agencyaddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Agency Address",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Agency Address",
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

                //agency span//
                TextField(
                    controller: agencyspan,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Aency Span",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Agency Span",
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
                //agency remarkable work
                TextField(
                    controller: remarkablework,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.3, color: Colors.red)),
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: " Remarkable Work",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Remarkable Work",
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

                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: UploadNow,
                      child: Text(
                        "Submit Now",
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
