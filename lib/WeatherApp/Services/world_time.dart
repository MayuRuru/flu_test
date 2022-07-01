import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;

  WorldTime( {this.location, this.flag, this.url})

  //because it is asyinc and we are awaiting in other component 'Future'- a promise:
  Future<void> getTime() async {

    Response response = await get("http://worldtimeapi.org/api/timezone/$url");
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //create a Date Time object:
    DateTime now = DateTime.parse(datetime); //String to convert to object datetime
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property:
    time = now.toString();
  }

}
