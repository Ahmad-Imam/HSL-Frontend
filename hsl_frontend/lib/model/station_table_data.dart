import 'package:flutter/material.dart';

class StationPaginationDataTable extends DataTableSource {
  var stationList;
  StationPaginationDataTable({
    required this.stationList,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (newValue) {
          print("row pressed: $newValue");
          print("${stationList[index].fid.toString()}");
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
