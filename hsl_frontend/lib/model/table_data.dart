import 'package:flutter/material.dart';

class TableData extends DataTableSource {
  var listTest;
  TableData({
    required this.listTest,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (newValue) {
          print("row pressed: $newValue");
        },
        cells: [
          DataCell(Text((index + 1).toString()), onTap: () {
            print("entry");
          }),
          DataCell(Text(listTest[index].departureName.toString())),
          DataCell(Text(listTest[index].departureId.toString())),
          DataCell(Text(listTest[index].departureDate.toString())),
          DataCell(Text(listTest[index].returnDate.toString())),
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
