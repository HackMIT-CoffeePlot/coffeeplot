import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import './searchbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LatLng? _currentLocation;
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  String _mapStyle = '';

  // Hardcoded Restaurants and Coffee Shops
  List<LatLng> _restaurants = [
    LatLng(42.37625334531107, -71.08809818828726),
    LatLng(42.37814720962953, -71.10737703434413),
    LatLng(42.39555676382587, -71.12085879035934),
    LatLng(42.37133658788123, -71.11473129016687),
    LatLng(42.367053554047835, -71.10534621189807),
    // ... Add more locations
  ];

  List<LatLng> _coffeeShops = [
    LatLng(42.3607, -71.0998),
    LatLng(42.3617, -71.1008),
    // ... Add more locations
  ];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _addRestaurantsAndCoffeeShops();
  }

  _getUserLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(42.35779391672727,
            -71.09678782116447); // Your hardcoded user location
        _markers.add(
          Marker(
            markerId: const MarkerId('userLocation'),
            position: _currentLocation!,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor
                  .hueGreen, // Setting user location marker as green
            ),
          ),
        );
      });
    } catch (e) {
      print("Error fetching user location: $e");
    }
  }

  _showBottomSheet(LatLng location) {
    // Determine if the location is a restaurant or coffee shop
    bool isRestaurant = _restaurants.contains(location);

    print(isRestaurant);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.2,
          initialChildSize: 0.5, // 30% of the screen
          maxChildSize: 0.89, // 100% of the screen
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                child: Column(
                  children: [
                    // Text('Listing Details', style: TextStyle(fontSize: 30, fontFamily: 'GraphikLCG-Semibold', color: Colors.green)),
                    // Text(
                    //   isRestaurant ? 'Restaurant Info' : 'Coffee Shop Info',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 24,
                    //       fontFamily: 'GraphikLCG-Semibold'),
                    // ),
                    // SizedBox(height: 20),
                    // Image(image: AssetImage('lib/svgs/compost-image-1.jpg'), height: 200, width: 200), // Replace with actual image
                    // SizedBox(height: 20),
                    // Text(
                    //     'Name: Greenhouse Restaurant'), // Replace with actual data
                    // Text('Rating: 4.5'), // Replace with actual data
                    // // ... Add more information as needed
                    Image(image: AssetImage('lib/svgs/bottom-sheet-image.jpg')), // Replace with actual image
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _addRestaurantsAndCoffeeShops() {
  Color restaurantColor = Color.fromARGB(255, 2, 90, 255);
  double restaurantHue = HSVColor.fromColor(restaurantColor).hue;

  Color coffeeShopColor = Color.fromARGB(255, 255, 21, 0);
  double coffeeShopHue = HSVColor.fromColor(coffeeShopColor).hue;

  _restaurants.forEach((restaurant) {
    _markers.add(
      Marker(
        markerId: MarkerId(
            'restaurant${restaurant.latitude}-${restaurant.longitude}'),
        position: restaurant,
        icon: BitmapDescriptor.defaultMarkerWithHue(restaurantHue),
        onTap: () => _showBottomSheet(restaurant),
      ),
    );
  });

  _coffeeShops.forEach((coffeeShop) {
    _markers.add(
      Marker(
        markerId:
            MarkerId('coffee${coffeeShop.latitude}-${coffeeShop.longitude}'),
        position: coffeeShop,
        icon: BitmapDescriptor.defaultMarkerWithHue(coffeeShopHue),
        onTap: () => _showBottomSheet(coffeeShop),
      ),
    );
  });
}


  Future<void> _loadMapStyle() async {
    rootBundle
        .loadString('lib/styles/mapstyles.txt')
        .then((string) => _mapStyle = string);
    _mapController?.setMapStyle(_mapStyle);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // _loadMapStyle(); // Uncomment if you want to use custom styles.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFEFA),
      body: Stack(
        children: [
          _currentLocation == null
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation!,
                    zoom: 14.0,
                  ),
                  markers: _markers,
                ),
          Positioned(
            top: 10.0,
            right: 15.0,
            left: 15.0,
            child: BarSearch(),
          ),
        ],
      ),
    );
  }
}
