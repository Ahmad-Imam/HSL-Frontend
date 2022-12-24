import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/station_list.dart';
import 'package:http/http.dart' as http;

import '../model/journey_list.dart';
import '../model/journey_table_data.dart';
import '../model/station_table_data.dart';

class Station extends StatefulWidget {
  const Station({super.key, required this.stationList});

  final List<StationList> stationList;

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
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
        title: Text("Station List"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          PaginatedDataTable(
            showCheckboxColumn: false,
            // sortColumnIndex: sortColumnIndex,
            // sortAscending: sortAscending,
            rowsPerPage: 100,
            columns: [
              DataColumn(
                label: Text("fid"),
              ),
              DataColumn(
                  label: Text("Id"),
                  onSort: (int a, bool b) {
                    // var data = widget.stationList.where(
                    //     (row) => (row.departureName.contains("Näkinsilta")));
                    // print(data.length);
                  }),
              DataColumn(
                label: Text("nimi"),
              ),
              DataColumn(
                label: Text("namn"),
              ),
              DataColumn(
                label: Text("name"),
              ),
              DataColumn(
                label: Text("osoite"),
              ),
              DataColumn(
                label: Text("address"),
              ),
              DataColumn(
                label: Text("kaupunki"),
              ),
            ],

            source: StationPaginationDataTable(
                stationList: widget.stationList, context: context),
          ),
          const Text("hola"),
        ],
      ),
    );
  }
}
