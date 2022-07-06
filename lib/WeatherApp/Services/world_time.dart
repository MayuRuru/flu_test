import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  bool isDaytime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  //because it is async and we are awaiting in other component 'Future'- a temporary placeholder a promise:
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a Date Time object passing properties we got from the data:
      DateTime now =
          DateTime.parse(datetime); //String to convert to object datetime
      now = now.add(Duration(hours: int.parse(offset)));

      //ternary for day or night:
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      //set the time property:
      //time = now.toString();
      //with the intl package to format it nicer:
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('there is an error! : $e');
      time = 'could not get time data';
    }
  }
}
