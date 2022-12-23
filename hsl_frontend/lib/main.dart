import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/home.dart';
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

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late List<JourneyList> snapshotData;
  late bool hasValue = false;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    // print("lol");
    // var snapshot = await fetchJourneyList(http.Client());
    // setState(() {
    //   snapshotData = snapshot;
    //   hasValue = true;
    // });
    // print(snapshot.length);
    // print("lol2");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(
          title: "ok ",
        )
        // hasValue
        //     ? Container(child: Text("ok fine"))
        //     : Container(child: Text("ok fine not")),
        );
  }
}
