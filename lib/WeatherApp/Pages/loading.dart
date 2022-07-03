import 'package:flutter/material.dart';
import 'package:firstflut/WeatherApp/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
/*  void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body); //import to convert the string of the json to data
  }*/

//String time = 'Loading...';

// a Function to instanciate a time zone class:

  void setupWorldTime() async {
    WorldTime instanceTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    await instanceTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instanceTime.location,
      'time': instanceTime.time,
      'flag': instanceTime.flag,
      'isDaytime': instanceTime.isDaytime,
    });
    /*   setState((){
      time = instanceTime.time!;
    });*/
  }

  @override
  void initState() {
    // run the original function:
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
