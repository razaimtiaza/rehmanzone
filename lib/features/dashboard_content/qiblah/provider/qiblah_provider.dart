// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

// class QiblahProvider extends ChangeNotifier {
//   double? qiblahDirection;
//   String? currentLocation;
//   bool isLoading = true;

//   Future<void> getLocationAndDirection() async {
//     try {
//       Position position = await _determinePosition();
//       currentLocation =
//           'Lat: ${position.latitude}, Long: ${position.longitude}';
//       await fetchQiblahDirection(position.latitude, position.longitude);
//     } catch (e) {
//       currentLocation = "Unable to fetch location";
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<Position> _determinePosition() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     if (permission == LocationPermission.deniedForever) {
//       throw Exception("Location Permission Denied");
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   Future<void> fetchQiblahDirection(double lat, double long) async {
//     final url = 'http://api.aladhan.com/v1/qibla/$lat/$long';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         qiblahDirection = data['data']['direction'];
//       }
//     } catch (e) {
//       qiblahDirection = null;
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
