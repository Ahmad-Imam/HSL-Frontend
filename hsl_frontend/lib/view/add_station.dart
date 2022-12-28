import 'dart:convert';
import 'package:hsl_frontend/model/station_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';

class AddStation extends StatefulWidget {
  const AddStation({Key? key}) : super(key: key);

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  clearTextField() {
    nimiTextEditingController.clear();
    namnTextEditingController.clear();
    nameTextEditingController.clear();
    osoiteTextEditingController.clear();
    addressTextEditingController.clear();
    operaattoTextEditingController.clear();
    kaupunkiTextEditingController.clear();
    stadTextEditingController.clear();
    kapasiteetTextEditingController.clear();
    xTextEditingController.clear();
    yTextEditingController.clear();
  }

  addToStationList() {
    Station station = Station(
        fid: (int.parse(stationSnapshotData.last.fid) + 1).toString(),
        id: (int.parse(stationSnapshotData.last.id) + 1).toString(),
        nimi: nimiTextEditingController.text,
        namn: namnTextEditingController.text,
        name: nameTextEditingController.text,
        osoite: osoiteTextEditingController.text,
        address: addressTextEditingController.text,
        kaupunki: kaupunkiTextEditingController.text,
        stad: stadTextEditingController.text,
        operaatto: operaattoTextEditingController.text,
        kapasiteet: kapasiteetTextEditingController.text,
        x: xTextEditingController.text,
        y: yTextEditingController.text);

    setState(() {
      stationSnapshotData.add(station);
    });

    clearTextField();
  }

  Future<http.Response> postRequest() async {
    var url = 'http://192.168.31.109:8080/writeStationListJson';
    print(nimiTextEditingController.text);

    Map data = {
      'fid': int.parse(stationSnapshotData.last.fid) + 1,
      'id': int.parse(stationSnapshotData.last.id) + 1,
      'nimi': nimiTextEditingController.text,
      'namn': namnTextEditingController.text,
      'name': nameTextEditingController.text,
      'osoite': osoiteTextEditingController.text,
      'address': addressTextEditingController.text,
      'operaatto': operaattoTextEditingController.text,
      'kaupunki': kaupunkiTextEditingController.text,
      'stad': stadTextEditingController.text,
      'kapasiteet': kapasiteetTextEditingController.text,
      'x': xTextEditingController.text,
      'y': yTextEditingController.text,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);

    return response;
  }

  TextEditingController nimiTextEditingController = TextEditingController();
  TextEditingController namnTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController osoiteTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController kaupunkiTextEditingController = TextEditingController();
  TextEditingController stadTextEditingController = TextEditingController();
  TextEditingController xTextEditingController = TextEditingController();
  TextEditingController yTextEditingController = TextEditingController();
  TextEditingController operaattoTextEditingController =
      TextEditingController();
  TextEditingController kapasiteetTextEditingController =
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
                          controller: nimiTextEditingController,
                          decoration: const InputDecoration(
                            hintText: "Enter the nimi of station",
                            border: InputBorder.none,
                            labelText: 'Nimi',
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
                          controller: namnTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Namn',
                            hintText: "Enter the namn of station",
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
                          controller: nameTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Name',
                            hintText: "Enter the name of station",
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
                          controller: osoiteTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Osoite',
                            hintText: "Enter the osoite of station",
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
                          controller: addressTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Address',
                            hintText: "Enter the address of station",
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
                          controller: kaupunkiTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Kaupunki',
                            hintText: "Enter the kaupunki of station",
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
                          controller: stadTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Stad',
                            hintText: "Enter the stad of station",
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
                          controller: operaattoTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Operaatto',
                            hintText: "Enter the operaatto of station",
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
                          controller: kapasiteetTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Kapasiteet',
                            hintText: "Enter the kapasiteet of station",
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
                          controller: xTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'X',
                            hintText: "Enter the x (Longitude) of station",
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
                          controller: yTextEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Y',
                            hintText: "Enter the y (Lattitude) of station",
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
                      addToStationList();

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'Station information added. Restart the application to see the updated result. Exit to return to previous page'),
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
                            'Failed to add Station information. Please try again later. Exit to return to previous page'),
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
