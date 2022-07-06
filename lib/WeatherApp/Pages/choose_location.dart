import 'package:flutter/material.dart';
import 'package:firstflut/WeatherApp/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Madrid', location: 'Barcelona', flag: 'bcn.png'),
    WorldTime(url: 'Europe/Brussels', location: 'Brussels', flag: 'bxl.png'),
    WorldTime(url: 'America/Tegucigalpa', location: 'El Remate', flag: 'guate.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'San Francisco', flag: 'sf.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Oaxaca', flag: 'oax.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'ny.png'),
    //WorldTime(url: 'Asia/Gaza', location: 'Haifa', flag: 'haifa.png'),
    //WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    //store an instance in a variable:
    WorldTime instanceTime = locations[index];
    await instanceTime.getTime();
    //navigate to home screen and pass the data to there:
    Navigator.pop(context, {
      'location': instanceTime.location,
      'time': instanceTime.time,
      'flag': instanceTime.flag,
      'isDaytime': instanceTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      //appbar automatically places a back arrow when we come form another screen!
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
          }
      ),
    );
  }
}
