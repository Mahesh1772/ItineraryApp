import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:flutter/material.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedItineraries>(
      builder: (context, savedItineraries, child) => Scaffold(
        appBar: AppBar(
          title: Text("Saved Itineraries"),
        ),
        body: ListView.builder(
          itemCount: savedItineraries.itineraries.length,
          itemBuilder: (context, index) {
            // Build UI for each saved itinerary
            List<Location> itinerary = savedItineraries.itineraries[index];
            // Customize the UI based on your requirements
            return ListTile(
              title: Text("Itinerary ${index + 1}"),
              // Display other information about the saved itinerary
            );
          },
        ),
      ),
    );
  }
}
