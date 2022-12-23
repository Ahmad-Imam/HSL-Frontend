import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/journey_list.dart';
import 'model/table_data.dart';

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

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int compareString(bool ascending, String value1, String value2) {
  //   return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  // }

  // int compareInt(bool ascending, int value1, int value2) {
  //   return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  // }

  // int? sortColumnIndex = 0;
  // bool sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<JourneyList>>(
          future: fetchJourneyList(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              return ListView(
                children: [
                  PaginatedDataTable(
                      showCheckboxColumn: false,
                      // sortColumnIndex: sortColumnIndex,
                      // sortAscending: sortAscending,
                      rowsPerPage: 200,
                      columns: [
                        DataColumn(
                          label: Text("Entry "),
                        ),
                        DataColumn(
                          label: Text("Departure Station Name"),
                          // onSort: (int columnIndex, bool ascending) {
                          //   setState(() {
                          //     sortColumnIndex = columnIndex;
                          //     sortAscending = ascending;
                          //   });
                          //   snapshot.data!.sort((tst1, tst2) =>
                          //       compareString(ascending, tst1.departureName,
                          //           tst2.departureName));
                          // }
                        ),
                        DataColumn(
                            label: Text("Departure Station Id"),
                            onSort: (int a, bool b) {
                              var data = snapshot.data!.where((row) =>
                                  (row.departureName.contains("Näkinsilta")));
                              print(data.length);
                            }),
                        DataColumn(
                          label: Text("Departure Date"),
                        ),
                        DataColumn(
                          label: Text("Return Station Name"),
                        ),
                        DataColumn(
                          label: Text("Return Station Id"),
                        ),
                        DataColumn(
                          label: Text("Return date"),
                        ),
                        DataColumn(
                          label: Text("Cover Distance (kilometer)"),
                        ),
                        DataColumn(
                          label: Text("Duration (minute)"),
                        ),
                      ],
                      source: TableData(listTest: snapshot.data)),
                  const Text("hola"),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
