import 'package:flutter/material.dart';
import 'package:hsl_frontend/model/station_list.dart';

import '../main.dart';
import '../view/station_single_view.dart';

class StationPaginationDataTable extends DataTableSource {
  var stationList;
  BuildContext context;
  StationPaginationDataTable({
    required this.stationList,
    required this.context,
  });

  double calculateAvgDeparture(var stationList) {
    double avgDepartureDistance = 0;
    stationList.forEach(
      (element) {
        // print(element.coverDistance);
        avgDepartureDistance += double.parse(element.coverDistance);
      },
    );
    return avgDepartureDistance / stationList.length;
  }

  double calculateAvgReturn(var stationList) {
    double avgReturnDistance = 0;
    stationList.forEach(
      (element) {
        // print(element.coverDistance);
        avgReturnDistance += double.parse(element.coverDistance);
      },
    );
    return avgReturnDistance / stationList.length;
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onSelectChanged: (newValue) {
          print("row pressed: $newValue");
          // print("${stationList[index].fid.toString()}");
          var departureListFiltered = journeySnapshotData
              .where((e) => e.departureName == stationList[index].nimi)
              .toList();

          var returnListFiltered = journeySnapshotData
              .where((e) => e.returnName == stationList[index].nimi)
              .toList();
          var avgDepartureDistance =
              calculateAvgDeparture(departureListFiltered);

          var avgReturnDistance = calculateAvgReturn(returnListFiltered);

          print(returnListFiltered.length);
          print(departureListFiltered.length);
          print(avgDepartureDistance);

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MapSample()),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StationSingle(
                      station: stationList[index],
                      avgDeparture: avgDepartureDistance,
                      avgReturn: avgReturnDistance,
                      totalDeparture: departureListFiltered.length,
                      totalReturn: returnListFiltered.length,
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
