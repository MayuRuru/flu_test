import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: (){
                  //we push an screen but that one continues to exist underneath
                  Navigator.pushNamed(context, '/location');
                },
                  icon: Icon(Icons.edit_location),
                label: Text('Edit location'),
              ),
            ],
          )),
    );
  }
}
