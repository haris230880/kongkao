import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
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
  late double buyerLatitude = 0; // Variable to store the buyer's latitude
  late double buyerLongitude = 0; // Variable to store the buyer's longitude
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
  void updateListOrderStatus(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=สำเร็จ&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });

    } catch (e) {
      print(e);
    }
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
                          color: Colors.grey,
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(12),
                              topEnd: Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          CircleAvatar(
                              maxRadius: 70,
                              backgroundImage: NetworkImage(
                                  API.BASE_URL + exchangemodel.photo!)),
                          Text('รายการ',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                          Text(exchangemodel.detail!.replaceAll('[', '').replaceAll(']', ''),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(exchangemodel.name!,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),
                            SizedBox(width: 10,),
                            Text(exchangemodel.lastname!,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),],),

                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('phone',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),

                              Text(exchangemodel.phone!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                          Text(exchangemodel.email!,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          50),
                                    ),
                                    elevation: 5,
                                    // Foreground color
                                    onPrimary: Colors.white,
                                    // Background color
                                    primary: kPrimaryColor,
                                    minimumSize: Size(100, 40))
                                    .copyWith(
                                    elevation: ButtonStyleButton
                                        .allOrNull(2.0)),
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
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          50),
                                    ),
                                    elevation: 5,
                                    // Foreground color
                                    onPrimary: Colors.white,
                                    // Background color
                                    primary: kPrimaryColor,
                                    minimumSize: Size(100, 40))
                                    .copyWith(
                                    elevation: ButtonStyleButton
                                        .allOrNull(2.0)),
                                onPressed: () {

                                },
                                child: Text('เสร็จสิ้น'),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )),
              ],
            ),
    );
  }
}
