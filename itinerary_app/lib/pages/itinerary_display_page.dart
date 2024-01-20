import 'package:flutter/material.dart';
import 'package:itinerary_app/pages/itenary_tiles.dart';
import 'package:itinerary_app/pages/timeline_tile.dart';

class ItineraryPage extends StatefulWidget {
  ItineraryPage({super.key});
  final List<ItineraryItem> _itinerary = [
    ItineraryItem(name: 'Flight', value1: true, value2: false, value3: true),
    ItineraryItem(name: 'Hotel', value1: false, value2: false, value3: true),
    ItineraryItem(
        name: 'Attractions', value1: false, value2: false, value3: true),
    ItineraryItem(name: 'Food', value1: false, value2: false, value3: true),
    ItineraryItem(
        name: 'Shopping', value1: false, value2: false, value3: false),
    ItineraryItem(
        name: 'Transport', value1: false, value2: false, value3: false),
    ItineraryItem(name: 'Others', value1: false, value2: true, value3: false),
  ];
  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: ListView.builder(
          itemCount: widget._itinerary.length,
          itemBuilder: (context, index) {
            return MyTimeLineTile(
              isFirst: widget._itinerary[index].value1,
              isLast: widget._itinerary[index].value2,
              isPast: widget._itinerary[index].value3,
              itinerary: widget._itinerary[index].name,
            );
          },
        ),
      ),
    );
  }
}

class ItineraryItem {
  final String name;
  final bool value1;
  final bool value2;
  final bool value3;

  ItineraryItem({
    required this.name,
    required this.value1,
    required this.value2,
    required this.value3,
  });
}
