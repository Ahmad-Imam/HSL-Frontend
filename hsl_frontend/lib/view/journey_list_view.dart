import 'package:flutter/material.dart';

import 'package:hsl_frontend/view/loading_screen.dart';

import '../model/journey_table_data.dart';

class JourneyListView extends StatefulWidget {
  const JourneyListView({super.key});

  @override
  State<JourneyListView> createState() => _JourneyListViewState();
}

class _JourneyListViewState extends State<JourneyListView> {
  // int compareString(bool ascending, String value1, String value2) {
  //   return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  // }

  // int compareInt(bool ascending, int value1, int value2) {
  //   return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  // }

  // int? sortColumnIndex = 0;
  // bool sortAscending = false;
  ScrollController scrollController = ScrollController();
  bool scrollTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journey List"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Row(
              children: [
                scrollTop
                    ? const Text(
                        "Start ",
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        "End ",
                        style: TextStyle(color: Colors.white),
                      ),
                scrollTop
                    ? const Icon(
                        Icons.arrow_circle_up,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
              ],
            ),
            onPressed: () {
              if (scrollTop) {
                scrollController.jumpTo(0);
                setState(() {
                  scrollTop = false;
                });
              } else {
                setState(() {
                  scrollTop = true;
                });

                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: PaginatedDataTable(
            showCheckboxColumn: false,
            // sortColumnIndex: sortColumnIndex,
            // sortAscending: sortAscending,
            rowsPerPage: 1000,
            columns: [
              const DataColumn(
                label: Text("Entry "),
              ),
              const DataColumn(
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
                  label: const Text("Departure Station Id"),
                  onSort: (int a, bool b) {}),
              const DataColumn(
                label: Text("Departure Date"),
              ),
              const DataColumn(
                label: Text("Return Station Name"),
              ),
              const DataColumn(
                label: Text("Return Station Id"),
              ),
              const DataColumn(
                label: Text("Return date"),
              ),
              const DataColumn(
                label: Text("Cover Distance (kilometer)"),
              ),
              const DataColumn(
                label: Text("Duration (minute)"),
              ),
            ],
            source:
                JourneyPaginationDataTable(journeyList: journeySnapshotData)),
      ),
    );
  }
}
