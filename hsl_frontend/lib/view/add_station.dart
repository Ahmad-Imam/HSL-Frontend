import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';

class AddStation extends StatelessWidget {
  AddStation({Key? key}) : super(key: key);

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

  TextEditingController nimiTextEditingController = new TextEditingController();
  TextEditingController namnTextEditingController = new TextEditingController();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController osoiteTextEditingController =
      new TextEditingController();
  TextEditingController addressTextEditingController =
      new TextEditingController();
  TextEditingController kaupunkiTextEditingController =
      new TextEditingController();
  TextEditingController stadTextEditingController = new TextEditingController();
  TextEditingController operaattoTextEditingController =
      new TextEditingController();
  TextEditingController kapasiteetTextEditingController =
      new TextEditingController();
  TextEditingController xTextEditingController = new TextEditingController();
  TextEditingController yTextEditingController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Please enter the details of station",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: nimiTextEditingController,
                          decoration: InputDecoration(
                            hintText: "Enter the nimi of station",
                            border: InputBorder.none,
                            labelText: 'Nimi',
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: namnTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Namn',
                            hintText: "Enter the namn of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: nameTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Name',
                            hintText: "Enter the name of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: osoiteTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Osoite',
                            hintText: "Enter the osoite of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: addressTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Address',
                            hintText: "Enter the address of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: kaupunkiTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Kaupunki',
                            hintText: "Enter the kaupunki of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: stadTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Stad',
                            hintText: "Enter the stad of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: operaattoTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Operaatto',
                            hintText: "Enter the operaatto of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: kapasiteetTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Kapasiteet',
                            hintText: "Enter the kapasiteet of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: xTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'X',
                            hintText: "Enter the x (Longitude) of station",
                          ))))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 242, 255),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextField(
                          controller: yTextEditingController,
                          decoration: InputDecoration(
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
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)),
                  ),
                  onPressed: () async {
                    // print(nimiTextEditingController.text);
                    // print(int.parse(stationSnapshotData.last.fid) + 1);
                    var response = await postRequest();

                    if (response.statusCode == 200) {
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

                    // print(nimiTextEditingController.text +
                    //     namnTextEditingController.text +
                    //     nameTextEditingController.text +
                    //     osoiteTextEditingController.text +
                    //     addressTextEditingController.text +
                    //     kaupunkiTextEditingController.text +
                    //     stadTextEditingController.text +
                    //     operaattoTextEditingController.text +
                    //     kapasiteetTextEditingController.text +
                    //     xTextEditingController.text +
                    //     yTextEditingController.text);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
