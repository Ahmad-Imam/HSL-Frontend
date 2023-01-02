import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/view/ip_address.dart';
import 'package:http/http.dart' as http;
import '../model/journey.dart';
import '../model/station.dart';
import 'home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

Future<List<Station>> fetchStationList(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://$ipAddress:$port/sendStationListJson'));
  return compute(parseStationList, response.body);
}

List<Station> parseStationList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Station>((json) => Station.fromJson(json)).toList();
}

Future<List<Journey>> fetchJourneyList(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://$ipAddress:$port/sendJourneyListJson'));

  return compute(parseJourneyList, response.body);
}

List<Journey> parseJourneyList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Journey>((json) => Journey.fromJson(json)).toList();
}

late List<Station> stationSnapshotData;
late List<Journey> journeySnapshotData;
bool hasValue = false;
String loadingText = "Please wait a moment while the data is configured";

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(seconds: 90), () {
      setState(() {
        loadingText =
            "Failed to connect. Check backend to see if it is running properly or if you have submitted your ip address and port number correctly";
      });
    });

    var snapshotStation = await fetchStationList(http.Client());
    var snapshotJourney = await fetchJourneyList(http.Client());
    setState(() {
      stationSnapshotData = snapshotStation;
      stationSnapshotData.removeLast();
      journeySnapshotData = snapshotJourney;
      hasValue = true;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: hasValue
          ? Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Explore"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Thank you for your patience !!!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          : Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        loadingText,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
