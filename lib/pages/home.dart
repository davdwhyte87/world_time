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
    data = data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDaytime']? 'daytime.jpg' : 'nighttime.jpg';
    Color? bgColor = data['isDaytime']? Colors.blue : Colors.indigo[700];
    // Colors? dataColor = (data['isDaytime']? Colors.blue : Colors.white) as Colors?;
    print("From home screen $data");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
    /////// HOME START //////////////////////////////////
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'time': result['time'],
                        'flag': result['flag'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                  // style: const ButtonStyle(backgroundColor: Colors.grey),
                  label: const Text("Choose location", style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.map_outlined, color: Colors.white,),
                ),
                const SizedBox(height:30 ,),
    ///////////// CITY NAME START ////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 2
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

     //////////// TIME DATA START ///////////////////////////////////////////
                Text(data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
