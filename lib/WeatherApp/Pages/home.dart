import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {}; //variable to store data as a map
  // we will update with useState when on tapping location
  // after waiting for the data that gets stored in result variable

  //Object? parameters;

  @override
  Widget build(BuildContext context) {
    // when data changes in useState it triggers a re-build!
    // so we add a check for whether is empty first:
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;

    /* parameters = parameters ?? ModalRoute.of(context)!.settings.arguments;
    Map data = jsonDecode(jsonEncode(parameters));*/

    //set background:

    String backImg = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? backColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
          child: Container(
           decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$backImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });

                  //we push an screen but that one continues to exist underneath
                  //Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
