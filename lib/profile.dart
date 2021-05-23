import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zohaib_task/Itemlist.dart';
import 'package:zohaib_task/login_res_model.dart';

class ProfilePage extends StatefulWidget {
 final LoginResponse model;
  ProfilePage({this.model});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double textFieldHeight = 60;

  Color iconColor = Colors.blue;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var y = MediaQuery.of(context).size.height;
    var x = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "PROFILE",
            style: TextStyle(color: Colors.blue),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.blue,
              ),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        //  backgroundColor: Color(0xff1d59d1),
//key: scaffoldKey,
        body: (isloading == true)
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : Container(
                color: Colors.white,
                height: y,
                width: x,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: y * 0.03,
                    ),
                    Container(
                        height: y * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/logo.png",
                            image: "${widget.model.userInfo.profileImage}",
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: x * 0.0, top: y * 0.03),
                      child: Container(
                        width: x,
                        alignment: Alignment.centerLeft,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("${widget.model.userInfo.name}",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: x * 0.0, top: y * 0.00),
                      child: Container(
                        width: x,
                        alignment: Alignment.centerLeft,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("${widget.model.userInfo.email}",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                                textAlign: TextAlign.center)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: x * 0.0, top: y * 0.06),
                      child: Container(
                        width: x,
                        alignment: Alignment.centerLeft,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Welcome to Demo App",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)),
                      ),
                    ),

                    //================  Welcome Message ====================\\

                    Padding(
                      padding: EdgeInsets.only(
                          left: x * 0.1, right: x * 0.1, top: y * 0.01),
                      child: Container(
                        width: x,
                        alignment: Alignment.centerLeft,
                        child: Align(
                            alignment: Alignment.center,
                            child:
                                Text("${widget.model.userInfo.welcomeMessage}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        //  color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center)),
                      ),
                    ),
                    //========================== Button =========================\\
                    //
                    //

                    Padding(
                      padding: EdgeInsets.only(
                        top: y * 0.1,
                        left: x * 0.18,
                        right: x * 0.18,
                      ),
                      child: Container(
                        child: AnimatedContainer(
                          curve: Curves.bounceOut,
                          duration: Duration(seconds: 3),
                          width: textOpacity == false
                              ? 0
                              : MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 45,
                            width: x * 0.84,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {
                                //  if (formKey.currentState.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemListPage(
                                        model: widget.model,
                                      ),
                                    ));
                                //   }
                              },
                              child: Text(
                                "EXPLORE MORE",
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
                  ],
                ),
              ));
  }
}
