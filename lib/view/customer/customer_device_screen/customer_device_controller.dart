import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as gmaps;

class CustomerDeviceController extends GetxController{
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    html.DivElement mapDiv = html.DivElement()..id = 'map';

    // Check if the body of the document is available before appending
    if (html.document.body != null) {
      html.document.body!.append(mapDiv);  // Ensure the body is non-null and append the map div
    } else {
      print("Error: Body element is null.");
    }

    // Initialize the map after the widget is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mapOptions = gmaps.MapOptions()
        ..zoom = 5
        ..center = gmaps.LatLng(20.5937, 78.9629); // Center on India

      // Create the map using the DivElement 'map'
      final map = gmaps.GMap(html.document.getElementById('map') as html.Element, mapOptions);

      // Add a marker for Delhi
      gmaps.Marker(gmaps.MarkerOptions()
        ..position = gmaps.LatLng(28.7041, 77.1025) // Delhi coordinates
        ..map = map
        ..title = 'Mahindra Thar'
      );

      // Add another marker for Bengaluru
      gmaps.Marker(gmaps.MarkerOptions()
        ..position = gmaps.LatLng(12.9716, 77.5946) // Bengaluru coordinates
        ..map = map
        ..title = 'Vehicle B'
      );
    });
  }
}