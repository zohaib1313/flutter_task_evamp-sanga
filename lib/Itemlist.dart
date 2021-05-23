import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zohaib_task/api.dart';
import 'package:zohaib_task/flush_bar.dart';
import 'package:zohaib_task/item_list_model.dart';
import 'package:zohaib_task/login_res_model.dart';
import 'package:zohaib_task/utils.dart';

class ItemListPage extends StatefulWidget {
  final LoginResponse model;
  ItemListPage({this.model});
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  double textFieldHeight = 60;

  Color iconColor = Colors.blue;

  bool isloading = false;
  ItemListModel _listModel;

  @override
  void initState() {
    isloading = true;

    Utils.checkInternetConnectivity().then((value) {
      if (value == true) {
        getItems(<String, dynamic>{
          "email": widget.model.userInfo.email,
          "token": widget.model.userInfo.token
        }).then((value) {
          setState(() {
            isloading = false;
            if (value.status == "success") {
              _listModel = value;
            } else if (value.status == "failure") {
              FlushBar.showSimpleFlushBar(
                  "Invalid Credentials", context, Colors.red, Colors.white);
            }
          });
        });
      } else {
        FlushBar.showSimpleFlushBar(
            "No Internet Connection", context, Colors.red, Colors.white);
      }
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
          title: Text(
            "Items List",
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
                height: y,
                width: x,
                child: ListView.builder(
                  itemCount: _listModel.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: y * 0.2,
                        width: x,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: x * 0.05,
                                    right: x * 0.05,
                                    top: y * 0.015,
                                    bottom: y * 0.015),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    "${_listModel.items[index].itemImage}",
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                    loadingBuilder: (BuildContext ctx,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: child);
                                      } else {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.blue),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: y * 0.03,
                                    bottom: y * 0.03,
                                    right: x * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${_listModel.items[index].name}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    Expanded(
                                      child: Text(
                                          "${_listModel.items[index].description}",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.start),
                                    ),
                                    Container(
                                      child: Text(
                                          "\$${_listModel.items[index].price}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )));
  }
}
