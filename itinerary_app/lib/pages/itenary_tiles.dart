import 'package:flutter/material.dart';

class ItineraryTile extends StatelessWidget {
  final String itinerary;
  ItineraryTile({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.flight),
          title: Text(itinerary),
          subtitle: Text('Flight from Singapore to Tokyo'),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
