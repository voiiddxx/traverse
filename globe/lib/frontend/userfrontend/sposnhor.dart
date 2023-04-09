import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/frontend/userfrontend/postrequirement.dart';

class SponshorScreen extends StatefulWidget {
  const SponshorScreen({super.key});

  @override
  State<SponshorScreen> createState() => _SponshorScreenState();
}

class _SponshorScreenState extends State<SponshorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 59, 59),
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/add.jpg"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Services",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: changetosponsher,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 85, 84, 84),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                          Text(
                            "Post Your Sponshorship Requirement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 84, 84),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color: Colors.white70,
                          size: 30,
                        ),
                        Text(
                          "See Your Sponshorship Requirement",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void changetosponsher() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostSponsherScreen();
    }));
  }
}
