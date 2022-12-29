import 'package:flutter/material.dart';

import 'package:hsl_frontend/view/add_journey.dart';
import 'package:hsl_frontend/view/add_station.dart';
import 'package:hsl_frontend/view/journey_list_view.dart';
import 'package:hsl_frontend/view/station_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to HSL City Bike Application",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StationListView()),
                    );
                  },
                  child: Text("Station List"))),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JourneyListView()),
                );
              },
              child: Text("Journey List")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStation()),
                );
              },
              child: Text("Add Station")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddJourney()),
                );
              },
              child: Text("Add Journey")),
        ],
      ),
    );
  }
}
