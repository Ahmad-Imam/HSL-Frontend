import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/station_list.dart';
import 'package:hsl_frontend/view/map.dart';

import '../main.dart';
import '../view/station_single_view.dart';

class StationPaginationDataTable extends DataTableSource {
  var stationList;
  BuildContext context;
  StationPaginationDataTable({
    required this.stationList,
    required this.context,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (newValue) {
          print("row pressed: $newValue");
          print("${stationList[index].fid.toString()}");
          var myListFiltered = journeySnapshotData
              .where((e) => e.departureName == stationList[index].nimi)
              .toList();
          print(stationList[index]);

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MapSample()),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StationSingle(
                      station: stationList[index],
                    )),
          );
        },
        cells: [
          DataCell(Text(stationList[index].fid.toString())),
          DataCell(Text(stationList[index].id.toString())),
          DataCell(Text(stationList[index].nimi.toString())),
          DataCell(Text(stationList[index].namn.toString())),
          DataCell(Text(stationList[index].name.toString())),
          DataCell(Text(stationList[index].osoite.toString())),
          DataCell(Text(stationList[index].address.toString())),
          DataCell(Text(stationList[index].kaupunki.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => stationList.length;

  @override
  int get selectedRowCount => 0;
}
