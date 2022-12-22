import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/journey_list.dart';

Future<List<JourneyList>> fetchJourneyList(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://192.168.31.109:8080/sendJson'));
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
  int compareString(bool ascending, String value1, String value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  int compareInt(bool ascending, int value1, int value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  int? sortColumnIndex = 0;
  bool sortAscending = false;
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
                        sortColumnIndex: sortColumnIndex,
                        sortAscending: sortAscending,
                        rowsPerPage: 200,
                        columns: [
                          const DataColumn(
                            label: Text("Entry "),
                          ),
                          DataColumn(
                              label: const Text("Departure Station Name"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                                // completeCSVList!.sort((tst1, tst2) =>
                                //     compareString(ascending, tst1.departureName,
                                //         tst2.departureName));
                              }),
                          DataColumn(
                              label: const Text("Departure Station Id"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Departure Date"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Return Station Name"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Return Station Id"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Return date"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Cover Distance (meter)"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
                          DataColumn(
                              label: const Text("Duration (minute)"),
                              onSort: (int columnIndex, bool ascending) {
                                setState(() {
                                  sortColumnIndex = columnIndex;
                                  sortAscending = ascending;
                                });
                              }),
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
            }));
  }
}

class TableData extends DataTableSource {
  var listTest;
  TableData({
    required this.listTest,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(listTest[index].departureName.toString())),
      DataCell(Text(listTest[index].departureId.toString())),
      DataCell(Text(listTest[index].departure_date.toString())),
      DataCell(Text(listTest[index].return_date.toString())),
      DataCell(Text(listTest[index].returnId.toString())),
      DataCell(Text(listTest[index].returnName.toString())),
      DataCell(Text(listTest[index].coverDistance.toString())),
      DataCell(Text(listTest[index].duration.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listTest.length;

  @override
  int get selectedRowCount => 0;
}
