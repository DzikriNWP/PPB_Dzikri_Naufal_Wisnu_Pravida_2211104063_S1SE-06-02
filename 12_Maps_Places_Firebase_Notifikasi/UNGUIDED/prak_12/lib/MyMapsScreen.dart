import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _kMapCenter = LatLng(-7.431391, 109.247833);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  GoogleMapController? _mapController;
  LocationResult? _pickedLocation;

  void _showPlacePicker() async {
    // Ensure you replace with your actual API key
    LocationResult? result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: "AIzaSyDFxpC7ky5_yPoIcd1veB3fOo1OcybI4cI", // Replace this!
          initialLocation: _kMapCenter,
        ),
      ),
    );

    // Null-safe handling of result
    if (result != null) {
      setState(() {
        _pickedLocation = result;
      });

      // Adjust based on the actual property for latitude and longitude
      final latLng = result.latLng; // Replace with the correct property
      if (latLng != null) {
        print("Latitude: ${latLng.latitude}");
        print("Longitude: ${latLng.longitude}");

        if (_mapController != null) {
          _mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(latLng.latitude, latLng.longitude),
                zoom: 14.0,
              ),
            ),
          );
        }
      } else {
        print("No valid coordinates found.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.place),
            onPressed: _showPlacePicker,
            tooltip: 'Pick a Location',
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
          ),
          // Display picked location info
          if (_pickedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Picked Location:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Name: ${_pickedLocation?.name ?? 'No Name'}'),
                      Text(
                          'Address: ${_pickedLocation?.formattedAddress ?? 'No Address'}'),
                      Text(
                        'Coordinates: ${_pickedLocation?.latLng?.latitude ?? 'N/A'}, ${_pickedLocation?.latLng?.longitude ?? 'N/A'}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPlacePicker,
        tooltip: 'Pick a Location',
        child: const Icon(Icons.add_location),
      ),
    );
  }
}
