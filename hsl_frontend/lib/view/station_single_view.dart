import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/station_list.dart';

class StationSingle extends StatefulWidget {
  const StationSingle({super.key, required this.station});
  final StationList station;

  @override
  State<StationSingle> createState() => _StationSingleState();
}

class _StationSingleState extends State<StationSingle> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late String lat;
  late String lng;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      lat = widget.station.y;
      lng = widget.station.x;
    });
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: prefer_final_fields
  late CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(double.parse(lat), double.parse(lng)),
      tilt: 0,
      zoom: 19.151926040649414);
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: const MarkerId("marker1"),
                  position: const LatLng(37.422131, -122.084801),
                  draggable: true,
                  onDragEnd: (value) {
                    // value is the new position
                  },
                  // To do: custom marker icon
                ),
                Marker(
                  markerId: const MarkerId("marker2"),
                  position: LatLng(double.parse(lat), double.parse(lng)),
                ),
              },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ExpansionTile(
            title: Text(
              "${widget.station.name}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Station",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            childrenPadding: EdgeInsets.all(0),
            children: <Widget>[
              ListTile(
                title: Text(
                  "Address: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.station.address}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: Text(
                  "Kaupunki: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.station.kaupunki}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: Text(
                  "Operaattor: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.station.operaatto}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ListTile(
                title: Text(
                  "Kapasiteet: ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  "${widget.station.kapasiteet}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}
