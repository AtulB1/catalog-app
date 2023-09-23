// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedbutton = false;
  final _formkey = GlobalKey<FormState>();

  moveToNext(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changedbutton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, Myroutes.homeroute);
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        changedbutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  height: 250,
                  width: 400,
                  // height: 1000,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be greater than 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(changedbutton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToNext(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 30,
                            width: changedbutton ? 50 : 100,
                            child: changedbutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.red,
                                  )
                                : Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
