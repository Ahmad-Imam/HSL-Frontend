import 'package:flutter/material.dart';

import 'package:hsl_frontend/view/loading_screen.dart';

import '../view/station_single_view.dart';

class StationPaginationDataTable extends DataTableSource {
  BuildContext context;
  StationPaginationDataTable({
    required this.context,
  });

  double calculateAvgDeparture(var stationList) {
    double avgDepartureDistance = 0;
    if (stationList.length == 0) return 0;
    stationList.forEach(
      (element) {
        avgDepartureDistance += double.parse(element.coverDistance);
      },
    );
    return avgDepartureDistance / stationList.length;
  }

  double calculateAvgReturn(var stationList) {
    double avgReturnDistance = 0;
    if (stationList.length == 0) return 0;
    stationList.forEach(
      (element) {
        avgReturnDistance += double.parse(element.coverDistance);
      },
    );
    return avgReturnDistance / stationList.length;
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (newValue) {
          var departureListFiltered = journeySnapshotData
              .where((e) => e.departureName == stationSnapshotData[index].nimi)
              .toList();

          var returnListFiltered = journeySnapshotData
              .where((e) => e.returnName == stationSnapshotData[index].nimi)
              .toList();
          var avgDepartureDistance =
              calculateAvgDeparture(departureListFiltered);

          var avgReturnDistance = calculateAvgReturn(returnListFiltered);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StationSingle(
                      station: stationSnapshotData[index],
                      avgDeparture: avgDepartureDistance,
                      avgReturn: avgReturnDistance,
                      totalDeparture: departureListFiltered.length,
                      totalReturn: returnListFiltered.length,
                    )),
          );
        },
        cells: [
          DataCell(Text(stationSnapshotData[index].fid.toString())),
          DataCell(Text(stationSnapshotData[index].id.toString())),
          DataCell(Text(stationSnapshotData[index].nimi.toString())),
          DataCell(Text(stationSnapshotData[index].namn.toString())),
          DataCell(Text(stationSnapshotData[index].name.toString())),
          DataCell(Text(stationSnapshotData[index].osoite.toString())),
          DataCell(Text(stationSnapshotData[index].address.toString())),
          DataCell(Text(stationSnapshotData[index].kaupunki.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => stationSnapshotData.length;

  @override
  int get selectedRowCount => 0;
}
