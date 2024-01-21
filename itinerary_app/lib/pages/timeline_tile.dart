import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/itenary_tiles.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTimeLineTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String itinerary;
  final String start;
  final String end;
  final category;
  final Location location;

  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.itinerary,
    required this.category,
    required this.start,
    required this.end,
    required this.location,
  });

  @override
  State<MyTimeLineTile> createState() => _MyTimeLineTileState();
}

class _MyTimeLineTileState extends State<MyTimeLineTile> {
  void removePlaceFromSelected() {
    Provider.of<SelectedPlaces>(context, listen: false)
        .removeFromSelectedPlaces(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TimelineTile(
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        beforeLineStyle: LineStyle(
          color: widget.isPast ? Colors.deepPurple : Colors.deepPurple.shade100,
          thickness: 5,
        ),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color: widget.isPast ? Colors.deepPurple : Colors.deepPurple.shade100,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: widget.isPast ? Colors.white : Colors.deepPurple.shade100,
          ),
        ),
        endChild: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  removePlaceFromSelected();
                },
                icon: Icons.delete_forever_rounded,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
            ],
          ),
          child: ItineraryTile(
            start: widget.start,
            end: widget.end,
            itinerary: widget.itinerary,
            category: widget.category,
          ),
        ),
      ),
    );
  }
}
