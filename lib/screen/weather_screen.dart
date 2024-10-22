import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/widgets/weather_display_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

    String? _currentAddress;
    Position? _currentPosition;

    Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      setState(() => _currentPosition = position);
      // Log the coordinates

    print('Current Position: Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}');
      
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition(); // Automatically fetch location on app start
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        position.latitude, position.longitude).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.country}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

@override
Widget build(BuildContext context) {
  double customWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    backgroundColor: const Color(0xFF2b2e54),
    body: Padding(
      padding: EdgeInsets.symmetric(
      horizontal: customWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Text('ADDRESS: ${_currentAddress ?? ""}',
          style: TextStyle(
            color: Colors.white
          ),
          ),
          SizedBox(
            //height: 650,
            //width: customWidth * 0.8,
            child: WeatherDisplayWidget(),
          ),
          
        ],
      ),
    ),
  );
}

}


