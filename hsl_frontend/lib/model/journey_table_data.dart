// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class JourneyPaginationDataTable extends DataTableSource {
  var journeyList;
  JourneyPaginationDataTable({
    required this.journeyList,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(journeyList[index].departureName.toString())),
      DataCell(Text(journeyList[index].departureId.toString())),
      DataCell(Text(journeyList[index].departureDate.toString())),
      DataCell(Text(journeyList[index].returnDate.toString())),
      DataCell(Text(journeyList[index].returnId.toString())),
      DataCell(Text(journeyList[index].returnName.toString())),
      DataCell(Text(journeyList[index].coverDistance.toString())),
      DataCell(Text(journeyList[index].duration.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => journeyList.length;

  @override
  int get selectedRowCount => 0;
}
