import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/station_list.dart';
import 'package:hsl_frontend/view/journey_list_view.dart';
import 'package:hsl_frontend/view/station_list_view.dart';
import 'package:http/http.dart' as http;
import 'model/journey_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<List<StationList>> fetchStationList(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://192.168.31.109:8080/sendStationListJson'));
  print(response.statusCode);

  return compute(parseStationList, response.body);
}

List<StationList> parseStationList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // print(parsed);
  return parsed.map<StationList>((json) => StationList.fromJson(json)).toList();
}

Future<List<JourneyList>> fetchJourneyList(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://192.168.31.109:8080/sendJourneyListJson'));
  print(response.statusCode);

  return compute(parseJourneyList, response.body);
}

List<JourneyList> parseJourneyList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // print(parsed);
  return parsed.map<JourneyList>((json) => JourneyList.fromJson(json)).toList();
}

late List<StationList> stationSnapshotData;
late List<JourneyList> journeySnapshotData;

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  late bool hasValue = false;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    print("lol");
    var snapshotStation = await fetchStationList(http.Client());
    var snapshotJourney = await fetchJourneyList(http.Client());
    setState(() {
      // journeySnapshotData = snapshot;
      stationSnapshotData = snapshotStation;
      journeySnapshotData = snapshotJourney;
      hasValue = true;
    });
    // print(snapshotJourney.length);
    print(snapshotStation.length);
    print("lol2");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: hasValue
            ? Station(
                stationList: stationSnapshotData,
              )
            : Scaffold(
                body: Center(
                child: CircularProgressIndicator(),
              )));
  }
}
