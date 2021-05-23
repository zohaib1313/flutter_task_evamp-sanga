import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zohaib_task/item_list_model.dart';
import 'package:zohaib_task/login_res_model.dart';

// ignore: missing_return
Future<LoginResponse> login(Map map) async {
   http.Response response = await http
      .post(
    "http://115.186.58.59:8080/demo_es/authenticate",
    headers: <String, String>{
      "Content-Type": "application/json; charset=utf-8",
    },
    body: jsonEncode(map),
  )
      .catchError((e) {
    print("Error Psot Data .....* $e");
  });

  if (response.statusCode == 200) {
    var model = jsonDecode(response.body);

    print(response.body);

    return LoginResponse.fromJson(model);
  } else {}
}

// ignore: missing_return
Future<ItemListModel> getItems(Map map) async {
  final http.Response response = await http
      .post(
    "http://115.186.58.59:8080/demo_es/getItems",
    headers: <String, String>{
      "Content-Type": "application/json; charset=utf-8",
    },
    body: jsonEncode(map),
  )
      .catchError((e) {
    print("Error Psot Data .....* $e");
  });

  if (response.statusCode == 200) {
    var model = jsonDecode(response.body);

    print(response.body);

    return ItemListModel.fromJson(model);
  } else {
     
  }
}
