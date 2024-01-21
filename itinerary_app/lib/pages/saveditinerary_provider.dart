import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class SavedItineraries extends ChangeNotifier {
  List<List<Location>> _itineraries = [];

  List<List<Location>> get itineraries => _itineraries;

  void addItinerary(List<Location> itinerary) {
    _itineraries.add(itinerary);
    notifyListeners();
  }
}
