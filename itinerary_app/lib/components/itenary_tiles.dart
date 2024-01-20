import 'package:flutter/material.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';

class ItineraryTile extends StatelessWidget {
  final String itinerary;
  ItineraryTile({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 10,
        top: 10,
      ),
      child: NeumorphicBox(
        child: Center(
          child: ListTile(
            leading: Icon(Icons.flight),
            title: Text(itinerary),
            subtitle: Text('Flight from Singapore to Bangkok'),
          ),
        ),
      ),
    );
  }
}
