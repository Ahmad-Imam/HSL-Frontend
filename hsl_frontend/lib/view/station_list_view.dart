import 'package:flutter/material.dart';
import '../model/station_table_data.dart';

class StationListView extends StatefulWidget {
  const StationListView({super.key});
  @override
  State<StationListView> createState() => _StationListViewState();
}

class _StationListViewState extends State<StationListView> {
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
        title: const Text("Station List"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
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
                if (!mounted) return;
                setState(() {
                  scrollTop = false;
                });
              } else {
                if (!mounted) return;
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
          rowsPerPage: 100,
          columns: [
            const DataColumn(
              label: Text("fid"),
            ),
            DataColumn(
                label: const Text("Id"),
                onSort: (int a, bool b) {
                  // var data = widget.stationList.where(
                  //     (row) => (row.departureName.contains("Näkinsilta")));
                  // print(data.length);
                }),
            const DataColumn(
              label: Text("nimi"),
            ),
            const DataColumn(
              label: Text("namn"),
            ),
            const DataColumn(
              label: Text("name"),
            ),
            const DataColumn(
              label: Text("osoite"),
            ),
            const DataColumn(
              label: Text("address"),
            ),
            const DataColumn(
              label: Text("kaupunki"),
            ),
          ],

          source: StationPaginationDataTable(context: context),
        ),
      ),
    );
  }
}
