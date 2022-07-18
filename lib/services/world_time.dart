import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool isDaytime = true;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime () async {
    try{
      var uri =Uri.https("worldtimeapi.org", "/api/timezone/$url");
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);
      // print(data);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //check if daytime
      isDaytime = now.hour>6 && now.hour < 20 ? true : false;
      // make time property string
      time = DateFormat.jm().format(now);
    }catch(e){
      print(e);
    }


  }
}