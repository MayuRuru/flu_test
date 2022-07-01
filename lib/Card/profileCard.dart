import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int profileLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('This is appbar'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0, //drop shadow gone
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              profileLevel +=1;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[800],
              ),
              const Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              //adding space
              Text(
                'Mayu',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),

              Text(
                'Level',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '$profileLevel',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'mail@mail.com',
                    style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
