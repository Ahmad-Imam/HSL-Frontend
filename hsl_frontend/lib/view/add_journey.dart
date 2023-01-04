// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/journey.dart';
import 'package:hsl_frontend/view/loading_screen.dart';
import 'package:http/http.dart' as http;

import 'ip_address.dart';

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
    var url = 'http://$ipAddress:$port/writeJourneyListJson';

    Map data = {
      'departureDate': departureDateTextEditingController.text,
      'returnDate': returnDateTextEditingController.text,
      'departureId': departureIdTextEditingController.text,
      'departureName': departureNameTextEditingController.text,
      'returnId': returnIdTextEditingController.text,
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
  final formKeyJourney = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text("Create Journey"),
        centerTitle: true,
      ),
      body: Form(
        key: formKeyJourney,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Please enter the details of journey",
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
                        child: TextFormField(
                            controller: departureDateTextEditingController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              try {
                                DateTime.parse('${text}Z').isUtc;
                              } catch (e) {
                                return "$e. Correct format is (YYYY-MM-DDTHH:MM:SS)";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Departure Date",
                              border: InputBorder.none,
                              labelText: 'Departure Date (YYYY-MM-DDTHH:MM:SS)',
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
                        child: TextFormField(
                            controller: returnDateTextEditingController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              try {
                                DateTime.parse('${text}Z').isUtc;
                              } catch (e) {
                                return "$e. Correct format is (YYYY-MM-DDTHH:MM:SS)";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Return Date (YYYY-MM-DDTHH:MM:SS)',
                              hintText: "Return Date",
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
                        child: TextFormField(
                            controller: departureIdTextEditingController,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (int.tryParse(val!) == null) {
                                return 'Only Number are allowed';
                              }
                            },
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
                        child: TextFormField(
                            controller: returnIdTextEditingController,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (int.tryParse(val!) == null) {
                                return 'Only Number are allowed';
                              }
                            },
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
                            controller: returnNameTextEditingController,
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
                        child: TextFormField(
                            controller: coverDistanceTextEditingController,
                            keyboardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              if (int.tryParse(text) == null) {
                                return 'Only Number are allowed';
                              }
                              if (int.parse(text) < 10) {
                                return 'Too short. Must be bigger than 10';
                              }
                              return null;
                            },
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
                        child: TextFormField(
                            controller: durationTextEditingController,
                            keyboardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              if (int.tryParse(text) == null) {
                                return 'Only Number are allowed';
                              }
                              if (int.parse(text) < 10) {
                                return 'Too short. Must be bigger than 10';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Duration (second)',
                              hintText:
                                  "Enter the duration of journey (second)",
                            ))))),
            //submit button
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
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
                      if (formKeyJourney.currentState!.validate()) {
                        var dateDiff =
                            DateTime.parse(returnDateTextEditingController.text)
                                .difference(DateTime.parse(
                                    departureDateTextEditingController.text));
                        print(dateDiff.isNegative);
                        if (dateDiff.isNegative) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Departure Date can not be after Return Date'),
                            duration: Duration(seconds: 3),
                          ));
                        } else {
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
                        }
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
