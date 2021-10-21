import 'dart:async';
import 'dart:convert';
import 'package:app_thsrc_001/model/trainInfo_model.dart';
import 'package:http/http.dart' as http;

class TimeableService {
Future<List<TrainInfo>> fetchTimeable() async {
List<TrainInfo> trains = [];

final response = await http.get(Uri.parse(
    'https://ptx.transportdata.tw/MOTC/v2/Rail/THSR/GeneralTimetable?\$format=JSON'));

if (response.statusCode == 200) {
  List<dynamic> lst = jsonDecode(response.body);

  for (int i = 0; i < lst.length; i++) {
    TrainInfo trainInfo = new TrainInfo();

    trainInfo.setUpdatetime(lst[i]['UpdateTime']);
    trainInfo.setEffectiveDate(lst[i]['EffectiveDate']);
    trainInfo.setExpiringDate(lst[i]['ExpiringDate']);

    trainInfo.setTrainNo(
        lst[i]['GeneralTimetable']['GeneralTrainInfo']['TrainNo']);

    String direction =
        lst[i]['GeneralTimetable']['GeneralTrainInfo']['Direction'] == 0
            ? '南下'
            : '北上';
    trainInfo.setDirection(direction);
    trainInfo.setStartingStationName(lst[i]['GeneralTimetable']
        ['GeneralTrainInfo']['StartingStationName']['Zh_tw']);
    trainInfo.setEndingStationName(lst[i]['GeneralTimetable']
        ['GeneralTrainInfo']['EndingStationName']['Zh_tw']);

    List stops = lst[i]['GeneralTimetable']['StopTimes'];
    StringBuffer sb = new StringBuffer();
    int j = 0;
    for (j = 0; j < stops.length - 1; j++) {
      sb.writeln(stops[j]['StationName']['Zh_tw'] +
          ' : ' +
          stops[j]['DepartureTime']);
    }

    sb.writeln(
        stops[j]['StationName']['Zh_tw'] + ' : ' + stops[j]['ArrivalTime']);

    trainInfo.setStation(sb.toString());
    sb.clear();

    trains.add(trainInfo);
  }
  return trains;
} else {
  // If the server did not return a 200 OK response,
  // then throw an exception.
  throw Exception('Failed to load album');
}
}
}