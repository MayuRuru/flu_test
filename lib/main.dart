import 'package:firstflut/WeatherApp/Pages/choose_location.dart';
import 'package:firstflut/WeatherApp/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'WeatherApp/Pages/home.dart';

//import 'package:flutter/services.dart';

//LANDSCAPE (MUTED IN IOS!)
/*Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);*/

//runApp(const MyFirstApp()); //encapsulate app into widget
/*class MyFirstApp extends StatelessWidget {
  const MyFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'MyFirstFlutterApp',
      home: GamePage(),
    );
  }
}*/

void main() => runApp(MaterialApp(
      //home: Home(),
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
