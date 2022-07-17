import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    var uri = Uri.https("jsonplaceholder.typicode.com", "/todos/1");
    http.Response response = await http.get(uri);
    Map data = jsonDecode(response.body);
    print(data['title']);
  }
  @override
  void initState() {
    super.initState();
    // getData();
    print("Init state function ran");
  }
  @override
  Widget build(BuildContext context) {
    print("init state function built");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Choose location "),
    );
  }
}
