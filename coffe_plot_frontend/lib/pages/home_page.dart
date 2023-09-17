import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import the Google Maps package
import 'package:geolocator/geolocator.dart'; // Import the Geolocator package
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LatLng? _currentLocation;
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  String _mapStyle = '';

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  _getUserLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _markers.add(
          Marker(
            markerId: MarkerId('userLocation'),
            position: _currentLocation!,
          ),
        );
      });
    } catch (e) {
      print("Error fetching user location: $e");
    }
  }

  // This function loads the custom map style
  // Future<void> _loadMapStyle() async {
  //   rootBundle.loadString('lib/styles/mapstyles.txt').then((string) => _mapStyle = string);
  //   _mapController?.setMapStyle(_mapStyle);
  // }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // _loadMapStyle(); // Once map is created, we load the style
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthHelper.removeToken(); // remove the token
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginSignupPage()),
              );
            },
          ),
        ],
      ),
      body: _currentLocation == null
          ? Center(
              child:
                  CircularProgressIndicator()) // Show a loading indicator until the location is fetched
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 11.0,
              ),
              markers: _markers,
            ),
    );
  }
}
