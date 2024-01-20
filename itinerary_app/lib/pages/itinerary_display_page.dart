import 'package:flutter/material.dart';
import 'package:itinerary_app/pages/itenary_tiles.dart';

class ItineraryPage extends StatefulWidget {
  ItineraryPage({super.key});
  final List _itinerary = [
    'Flight',
    'Hotel',
    'Attractions',
    'Food',
    'Shopping',
    'Transport',
    'Others'
  ];
  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount: widget._itinerary.length,
        itemBuilder: (context, index) {
          return ItineraryTile(itinerary : widget._itinerary[index]);
        },
      ),
    );
  }
}
