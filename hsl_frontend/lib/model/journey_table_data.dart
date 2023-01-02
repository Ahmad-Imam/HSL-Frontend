// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hsl_frontend/view/loading_screen.dart';

class JourneyPaginationDataTable extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(journeySnapshotData[index].departureName.toString())),
      DataCell(Text(journeySnapshotData[index].departureId.toString())),
      DataCell(Text(journeySnapshotData[index].departureDate.toString())),
      DataCell(Text(journeySnapshotData[index].returnDate.toString())),
      DataCell(Text(journeySnapshotData[index].returnId.toString())),
      DataCell(Text(journeySnapshotData[index].returnName.toString())),
      DataCell(Text(journeySnapshotData[index].coverDistance.toString())),
      DataCell(Text(journeySnapshotData[index].duration.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => journeySnapshotData.length;

  @override
  int get selectedRowCount => 0;
}
