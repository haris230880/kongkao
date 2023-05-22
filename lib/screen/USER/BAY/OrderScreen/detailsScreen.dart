import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/model/exchangemodel.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.exchangemodel})
      : super(key: key);
  final ExchangeModel exchangemodel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final ExchangeModel exchangemodel;
  late double buyerLatitude; // Variable to store the buyer's latitude
  late double buyerLongitude; // Variable to store the buyer's longitude
  @override
  void initState() {
    super.initState();
    exchangemodel = widget.exchangemodel;
    _getCurrentLocation(); // Call the method to get the current location
  }

  // Method to get the current location
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      buyerLatitude = position.latitude;
      buyerLongitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          // Display other details

          // Map and navigation button
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(0, 0), // Set the initial map center here
                zoom: 10.0, // Set the initial zoom level here
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 30.0,
                      height: 30.0,
                      point: LatLng(
                        buyerLatitude, // Replace with the actual buyer's latitude
                        buyerLongitude, // Replace with the actual buyer's longitude
                      ),
                      builder: (ctx) => Container(
                        child: Icon(Icons.person),
                      ),
                    ),
                    Marker(
                      width: 30.0,
                      height: 30.0,
                      point: LatLng(
                        8.197578072234942, // Replace with the actual seller's latitude
                        99.59503144019905, // Replace with the actual seller's longitude
                      ),
                      builder: (ctx) => Container(
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add navigation button here
          ElevatedButton(
            onPressed: () {
              double buyerLat =
                  buyerLatitude; // Replace with the actual buyer's latitude
              double buyerLng =
                  buyerLongitude; // Replace with the actual buyer's longitude
              double sellerLat =
                  8.197578072234942; // Replace with the actual seller's latitude
              double sellerLng =
                  99.59503144019905; // Replace with the actual seller's longitude

              // Open a navigation app (e.g., Google Maps) with the buyer and seller coordinates
              String url =
                  'https://www.google.com/maps/dir/?api=1&origin=$buyerLat,$buyerLng&destination=$sellerLat,$sellerLng';
              launch(url);
            },
            child: Text('Navigate'),
          ),
        ],
      ),
    );
  }
}
