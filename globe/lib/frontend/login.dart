import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:globe/backend/dartbackend/authmethod.dart';
import 'package:globe/frontend/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthService authService = AuthService();

  void Singnin() {
    AuthService()
        .login(context: context, email: email.text, password: password.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
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
              Color.fromARGB(255, 255, 27, 84),
              Color.fromARGB(255, 255, 29, 29),
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create Your Accoyunt Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  //===============email textfield================//
                  TextField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.3, color: Colors.red)),
                        focusColor: Colors.white,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: " Enter Your Email",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Email: ",
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
                  //========password textfield=======//
                  TextField(
                      controller: password,
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
                          "Password: ",
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

                  //=====button======//
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 36, 36, 36)),
                          onPressed: Singnin,
                          child: Text(
                            "Create Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have An Account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterScreen();
                              }));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
