import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zohaib_task/api.dart';
import 'package:zohaib_task/flush_bar.dart';
import 'package:zohaib_task/profile.dart';
import 'package:zohaib_task/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  String baseUrlLogin = "${DoctorStaticData.BASE_URL}/api/Patient/CheckLogin";
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double textFieldHeight = 60;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Color iconColor = Colors.blue;

  ///         Resposne Data Map in  below function       \\\
  ///
  ///
  String status, utype;
  bool connectivityError = false;
  bool isloading = false;
  bool textOpacity = false;
  bool singUpAnimation = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        textOpacity = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = "demo@evampsaanga.com";
    _passwordController.text = "demo@123";

    var y = MediaQuery.of(context).size.height;
    var x = MediaQuery.of(context).size.width;
    return Scaffold(
        //   resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1d59d1),
        key: scaffoldKey,
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                  height: y,
                  width: x,
                  padding: EdgeInsets.only(left: x * 0.04, right: x * 0.04),
                  child: Stack(
                    children: [
                      Container(
                        height: y,
                        width: x,
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                //  color: Colors.red,
                                alignment: Alignment.centerLeft,

                                width: x,
                                padding: EdgeInsets.only(
                                    left: x * 0.02, top: y * 0.2),
                                child: Image.asset(
                                  "assets/e.png",
                                  fit: BoxFit.fill,
                                ),
                              ),

                              Container(
                                width: x,
                                alignment: Alignment.centerLeft,
                                child: AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeIn,
                                  opacity: textOpacity == false ? 0 : 1,
                                  child: AnimatedContainer(
                                    padding: EdgeInsets.only(
                                      left: textOpacity == false ? 100 : 10,
                                    ),
                                    duration: Duration(seconds: 2),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Welcome to",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                            textAlign: TextAlign.center)),
                                  ),
                                ),
                              ),

                              Container(
                                width: x,
                                alignment: Alignment.centerLeft,
                                child: AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeIn,
                                  opacity: textOpacity == false ? 0 : 1,
                                  child: AnimatedContainer(
                                    padding: EdgeInsets.only(
                                      left: textOpacity == false ? 100 : 10,
                                    ),
                                    duration: Duration(seconds: 2),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Demo App",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                            textAlign: TextAlign.center)),
                                  ),
                                ),
                              ),
                              Container(
                                width: x,
                                alignment: Alignment.centerLeft,
                                child: AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeIn,
                                  opacity: textOpacity == false ? 0 : 1,
                                  child: AnimatedContainer(
                                    padding: EdgeInsets.only(
                                      left: textOpacity == false ? 100 : 10,
                                    ),
                                    duration: Duration(seconds: 2),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Login",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                            textAlign: TextAlign.center)),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: y * 0.1),
                                child: Container(
                                  width: x,
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedOpacity(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    opacity: textOpacity == false ? 0 : 1,
                                    child: AnimatedContainer(
                                      padding: EdgeInsets.only(
                                        left: textOpacity == false ? 100 : 15,
                                      ),
                                      duration: Duration(seconds: 2),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Enter Your Email",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center)),
                                    ),
                                  ),
                                ),
                              ),

                              ///           Phone Number        \\\
                              ///
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 0, right: x * 0.03),
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(seconds: 2),
                                  width: textOpacity == false
                                      ? 0
                                      : MediaQuery.of(context).size.width,
                                  child: Container(
                                    //color: Colors.grey,
                                    height: y * 0.11,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: _emailController,
                                      keyboardType:
                                          TextInputType.emailAddress,
                                      validator: validateEmail,
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        hintText: "email",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: iconColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: y * 0.01),
                                child: Container(
                                  width: x,
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedOpacity(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    opacity: textOpacity == false ? 0 : 1,
                                    child: AnimatedContainer(
                                      padding: EdgeInsets.only(
                                        left: textOpacity == false ? 100 : 15,
                                      ),
                                      duration: Duration(seconds: 2),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Enter Password",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center)),
                                    ),
                                  ),
                                ),
                              ),

                              ///           Password         \\\
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 2, bottom: 0, right: x * 0.03),
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(seconds: 2),
                                  width: textOpacity == false
                                      ? 0
                                      : MediaQuery.of(context).size.width,
                                  child: Container(
                                    //  color: Colors.grey,
                                    height: y * 0.11,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      controller: _passwordController,
                                      keyboardType: TextInputType.text,
                                      validator: RequiredValidator(
                                          errorText: "password is required"),
                                      decoration: InputDecoration(
                                        //  isDense: true,

                                        //    contentPadding: EdgeInsets.symmetric(vertical: 15),
                                        //  labelText: "Password",
                                        // labelStyle: _textStyleBlueTheme,
                                        // border: OutlineInputBorder(
                                        //     borderRadius:
                                        //         BorderRadius.circular(30)),

                                        hintText: "password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),

                                        prefixIcon: Icon(
                                          Icons.lock_open,
                                          color: iconColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //                                  Button Login                \\\

                            Padding(
                                padding: EdgeInsets.only(
                                  top: y * 0.01,
                                  left: x * 0.18,
                                  right: x * 0.18,
                                ),
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration: Duration(seconds: 2),
                                  width: textOpacity == false
                                      ? 0
                                      : MediaQuery.of(context).size.width,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.blue,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlue
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      height: 45,
                                      width: x * 0.84,
                                      // ignore: deprecated_member_use
                                      child: FlatButton(
                                        onPressed: () {
                                          if (formKey.currentState
                                              .validate()) {
                                            Utils.checkInternetConnectivity()
                                                .then((value) {
                                              if (value == true) {
                                                isloading = true;
                                                setState(() {
                                                  login(<String, dynamic>{
                                                    "userEmail":
                                                        _emailController.text,
                                                    "password":
                                                        _passwordController
                                                            .text
                                                  }).then((value) {
                                                    setState(() {
                                                      isloading = false;
                                                      if (value.status ==
                                                          "success") {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ProfilePage(
                                                                model: value,
                                                              ),
                                                            ));
                                                      } else if (value
                                                              .status ==
                                                          "failure") {
                                                        FlushBar.showSimpleFlushBar(
                                                            "Invalid Credentials",
                                                            context,
                                                            Colors.red,
                                                            Colors.white);
                                                      }
                                                    });
                                                  });
                                                });
                                              } else {
                                                FlushBar.showSimpleFlushBar(
                                                    "No Internet Connection",
                                                    context,
                                                    Colors.red,
                                                    Colors.white);
                                              }
                                            });
                                          }
                                        },
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              ///               End Button Login              \\\
                            ],
                          ),
                        ),
                      ),
                      isloading == true
                          ? Container(
                       
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  String validateEmail(String value) {
    String patttern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter an e-mail!';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid e-mail!';
    }
    return null;
  }
}
