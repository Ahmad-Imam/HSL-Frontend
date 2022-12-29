import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/journey.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../model/station_list.dart';

class AddJourney extends StatefulWidget {
  const AddJourney({Key? key}) : super(key: key);

  @override
  State<AddJourney> createState() => _AddJourneyState();
}

class _AddJourneyState extends State<AddJourney> {
  clearTextField() {
    departureDateTextEditingController.clear();
    returnDateTextEditingController.clear();
    departureIdTextEditingController.clear();
    departureNameTextEditingController.clear();
    returnIdTextEditingController.clear();
    returnNameTextEditingController.clear();
    coverDistanceTextEditingController.clear();
    durationTextEditingController.clear();
  }

  addToJourneyList() {
    Journey journey = Journey(
        departureDate: departureDateTextEditingController.text,
        returnDate: returnDateTextEditingController.text,
        departureId: departureIdTextEditingController.text,
        departureName: departureNameTextEditingController.text,
        returnId: returnIdTextEditingController.text,
        coverDistance: coverDistanceTextEditingController.text,
        duration: durationTextEditingController.text,
        returnName: returnNameTextEditingController.text);
    setState(() {
      journeySnapshotData.add(journey);
    });

    clearTextField();
  }

  Future<http.Response> postRequest() async {
    var url = 'http://192.168.31.109:8080/writeJourneyListJson';
    print(departureDateTextEditingController.text);

    Map data = {
      'departureDate': departureDateTextEditingController.text,
      'returnDate': returnDateTextEditingController.text,
      'departureId': departureIdTextEditingController.text,
      'departureName': departureNameTextEditingController.text,
      'returnIdText': returnIdTextEditingController.text,
      'returnName': returnNameTextEditingController.text,
      'coverDistance': coverDistanceTextEditingController.text,
      'duration': durationTextEditingController.text,
    };

    var body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    return response;
  }

  TextEditingController departureDateTextEditingController =
      TextEditingController();
  TextEditingController returnDateTextEditingController =
      TextEditingController();
  TextEditingController departureIdTextEditingController =
      TextEditingController();
  TextEditingController departureNameTextEditingController =
      TextEditingController();
  TextEditingController returnIdTextEditingController = TextEditingController();
  TextEditingController coverDistanceTextEditingController =
      TextEditingController();
  TextEditingController durationTextEditingController = TextEditingController();
  TextEditingController returnNameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Please enter the details of station",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: departureDateTextEditingController,
                          decoration: const InputDecoration(
                            hintText: "Departure date (YY-MM-DDTHH:MM:SS)",
                            border: InputBorder.none,
                            labelText: 'Departure Date',
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: returnDateTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Return Date',
                            hintText: "Return date (YY-MM-DDTHH:MM:SS)",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: departureIdTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Departure Id',
                            hintText: "Enter the departure id of journey",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: departureNameTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Departure Station Name',
                            hintText:
                                "Enter the departure station name of journey",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: returnIdTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Return Id',
                            hintText: "Enter the return id of journey",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: coverDistanceTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Return Station Name',
                            hintText:
                                "Enter the return station name of journey",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: durationTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Cover Distance (meter)',
                            hintText:
                                "Enter the cover distance of journey (meter)",
                          ))))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 242, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: returnNameTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Duration (second)',
                            hintText: "Enter the duration of journey (second)",
                          ))))),
          //submit button
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.green)),
                  ),
                  onPressed: () async {
                    var response = await postRequest();
                    if (response.statusCode == 200) {
                      addToJourneyList();

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'Journey information added. Exit to return to previous page'),
                        duration: const Duration(seconds: 10),
                        action: SnackBarAction(
                          label: 'Exit',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'Failed to add Journey information. Please try again later. Exit to return to previous page'),
                        duration: const Duration(seconds: 10),
                        action: SnackBarAction(
                          label: 'Exit',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ));
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
