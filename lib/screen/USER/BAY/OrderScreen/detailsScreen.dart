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
  late double saleLatitude;
  late double saleLongitude;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    exchangemodel = widget.exchangemodel;
    saleLatitude = double.parse(exchangemodel.latitude!);
    saleLongitude = double.parse(exchangemodel.longitude!);
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        buyerLatitude = position.latitude;
        buyerLongitude = position.longitude;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Row(
            children: [
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(children: [
                  TextSpan(
                    text: "K",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  TextSpan(
                    text: "ongkao ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ]),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'ประวัติ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                  ],
                ))
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(12),
                                topEnd: Radius.circular(12))),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              buyerLatitude!, // Replace with the actual buyer's latitude
                              buyerLongitude!, // Replace with the actual buyer's longitude
                            ),
                            zoom: 12.0,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId('buyer'),
                              position: LatLng(
                                buyerLatitude!, // Replace with the actual buyer's latitude
                                buyerLongitude!, // Replace with the actual buyer's longitude
                              ),
                              icon: BitmapDescriptor.defaultMarker,
                            ),
                            Marker(
                              markerId: MarkerId('seller'),
                              position: LatLng(
                                saleLatitude, // Use the converted value
                                saleLongitude, // Use the converted value
                              ),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueOrange),
                            ),
                          },
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: fixsixe.screenWidth,
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(12),
                                topEnd: Radius.circular(12))),
                        child: Column(children: [
                          Text('รายการ'),
                          
                          
                          
                          ElevatedButton(
                          onPressed: () {
                            double buyerLat =
                                buyerLatitude; // Replace with the actual buyer's latitude
                            double buyerLng =
                                buyerLongitude; // Replace with the actual buyer's longitude
                            double sellerLat =
                                saleLatitude; // Replace with the actual seller's latitude
                            double sellerLng =
                                saleLongitude; // Replace with the actual seller's longitude

                            // Open a navigation app (e.g., Google Maps) with the buyer and seller coordinates
                            String url =
                                'https://www.google.com/maps/dir/?api=1&origin=$buyerLat,$buyerLng&destination=$sellerLat,$sellerLng';
                            launch(url);
                          },
                          child: Text('นำทาง'),
                        ),]),

                      )),

                ],
              ),
    );
  }
}
