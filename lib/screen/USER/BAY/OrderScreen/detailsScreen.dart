import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants.dart';
import 'package:project/model/exchangemodel.dart';
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
    _getCurrentLocation();
    exchangemodel = widget.exchangemodel;
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        buyerLatitude = position.latitude;
        buyerLongitude = position.longitude;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0, 0), // Set the initial map center here
                  zoom: 10.0, // Set the initial zoom level here
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('buyer'),
                    position: LatLng(
                      buyerLatitude, // Replace with the actual buyer's latitude
                      buyerLongitude, // Replace with the actual buyer's longitude
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                  ),
                  Marker(
                    markerId: MarkerId('seller'),
                    position: LatLng(
                      8.197578072234942, // Replace with the actual seller's latitude
                      99.59503144019905, // Replace with the actual seller's longitude
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueOrange),
                  ),
                },
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
        ));
  }
}
