import 'package:flutter/material.dart';
import 'package:globe/frontend/adminfrontend/addagency.dart';
import 'package:globe/frontend/adminfrontend/getagency.dart';
import 'package:globe/frontend/onboarding.dart';
import 'package:globe/frontend/register.dart';
import 'package:globe/frontend/userfrontend/userhome.dart';
import 'package:globe/utils/extra.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoardingScreen(),
    );
  }
}
