import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final selectedPlacesProvider = Provider.of<SelectedPlaces>(context);
    List<Location> itineraryList = selectedPlacesProvider.getSelectedPlaces();
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Itineraries"),
      ),
      body: ListView.builder(
        itemCount: itineraryList.length,
        itemBuilder: (context, index) {
          // Build UI for each selected place
          Location place = itineraryList[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Text(place.location),
            // You can customize this UI based on your requirements
          );
        },
      ),
    );
  }
}
