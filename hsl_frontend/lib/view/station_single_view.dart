import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/station.dart';

class StationSingle extends StatefulWidget {
  const StationSingle(
      {super.key,
      required this.station,
      required this.avgDeparture,
      required this.avgReturn,
      required this.totalDeparture,
      required this.totalReturn});
  final Station station;
  final double avgDeparture;
  final double avgReturn;
  final int totalDeparture;
  final int totalReturn;

  @override
  State<StationSingle> createState() => _StationSingleState();
}

class _StationSingleState extends State<StationSingle> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  String lat = "0";
  String lng = "0";

  @override
  void initState() {
    if (double.tryParse(widget.station.y) != null ||
        double.tryParse(widget.station.y) != null) {
      setState(() {
        lat = widget.station.y;
        lng = widget.station.x;
      });
    }

    super.initState();
  }

  // ignore: prefer_final_fields
  late CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(double.parse(lat), double.parse(lng)),
      tilt: 0,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 246, 255),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          double.parse(lat) == 0 || double.parse(lng) == 0
              ? Column(
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No location found with Lattitude: ${widget.station.y} and Longitude: ${widget.station.x}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: {
                        Marker(
                          markerId: const MarkerId("marker1"),
                          position:
                              LatLng(double.parse(lat), double.parse(lng)),
                        ),
                      },
                      initialCameraPosition: _kLake,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              widget.station.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              "Station",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            childrenPadding: const EdgeInsets.all(0),
            children: <Widget>[
              ListTile(
                title: const Text(
                  "Address: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  widget.station.address,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: const Text(
                  "Total Departure: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.totalDeparture}",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: const Text(
                  "Total Return: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.totalReturn}",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: const Text(
                  "Average Distance of Departures: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.avgDeparture.floorToDouble()}",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: const Text(
                  "Average Distance of Returns: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: Text(
                  "${widget.avgReturn.floorToDouble()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
}
