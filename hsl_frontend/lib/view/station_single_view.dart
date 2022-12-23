import 'package:flutter/material.dart';

import '../model/station_list.dart';

class StationSingle extends StatefulWidget {
  const StationSingle({super.key, required this.station});
  final StationList station;

  @override
  State<StationSingle> createState() => _StationSingleState();
}

class _StationSingleState extends State<StationSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Text("${widget.station.address}"),
      ),
    ));
  }
}
