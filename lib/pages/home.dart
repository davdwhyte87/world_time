import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print("From home screen $data");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(Icons.send),

              ),
              SizedBox(height:30 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                      fontSize: 30,
                      letterSpacing: 2
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 66
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
