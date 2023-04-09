import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/dartbackend/hireagencybackend.dart';

class HireAgencyScreen extends StatefulWidget {
  const HireAgencyScreen({super.key});

  @override
  State<HireAgencyScreen> createState() => _HireAgencyScreenState();
}

class _HireAgencyScreenState extends State<HireAgencyScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController product = TextEditingController();
  final TextEditingController productcategory = TextEditingController();
  final hireService hireservice = hireService();

  void postit() {
    hireService().hirenow(
        context: context,
        name: name.text,
        email: email.text,
        mobilenumber: mobilenumber.text,
        product: product.text,
        productcategory: productcategory.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Now Hire The Agency",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                  controller: name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3, color: Colors.red)),
                    focusColor: Colors.white,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: " Enter Your Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Name: ",
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
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3, color: Colors.red)),
                    focusColor: Colors.white,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: " Enter Your Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Email ",
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
                  controller: mobilenumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3, color: Colors.red)),
                    focusColor: Colors.white,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: " Enter Your Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Mobile No: ",
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
                  controller: product,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3, color: Colors.red)),
                    focusColor: Colors.white,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: " Enter Your Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Product: ",
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
                  controller: productcategory,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.3, color: Colors.red)),
                    focusColor: Colors.white,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: " Enter Your Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Product Category: ",
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
                child: ElevatedButton(onPressed: postit, child: Text("Hire")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
