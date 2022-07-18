import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "London", flag: "uk.jpg", url: "Europe/London"),
    WorldTime(location: "Anthes", flag: "germany.jpg", url: "Europe/Berlin"),
    WorldTime(location: "Cairo", flag: "egypt.jpg", url: "Africa/Cairo"),
    WorldTime(location: "Nairobi", flag: "kenya.jpg", url: "Africa/Nairobi"),
    WorldTime(location: "Chicago", flag: "usa.jpg", url: "America/Chicago"),
    WorldTime(location: "New York", flag: "usa.jpg", url: "America/New_York"),
  ];
  @override
  void initState() {
    super.initState();
    // getData();
    print("Init state function ran");
  }

  void updateTime(index) async{
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDaytime": worldTime.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location,),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
