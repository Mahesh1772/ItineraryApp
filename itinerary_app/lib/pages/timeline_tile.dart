import 'package:flutter/material.dart';
import 'package:itinerary_app/pages/itenary_tiles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String itinerary;
  final String start;
  final String end;
  final category;
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.itinerary,
    required this.category,
    required this.start, 
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.deepPurple : Colors.deepPurple.shade100,
          thickness: 5,
        ),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color: isPast ? Colors.deepPurple : Colors.deepPurple.shade100,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.deepPurple.shade100,
          ),
        ),
        endChild: ItineraryTile(
          start: start,
          end: end,
          itinerary: itinerary,
          category: category,
        ),
      ),
    );
  }
}
