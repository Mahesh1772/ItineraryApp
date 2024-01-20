import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

/*
class PlacesTile extends StatefulWidget {
  @override
  State<PlacesTile> createState() => _PlacesTileState();
}

class _PlacesTileState extends State<PlacesTile> {
  List currentSelectedValues = [];

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                'lib/assets/images/jewel.jpg',
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Icon(Icons.wb_sunny_outlined, size: 30.sp),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The Jewel',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Attractions',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rollingIconBuilder(bool value, Size iconSize, bool foreground) {
  IconData data;

  if (value) {
    data = Icons.check_circle;
  } else {
    data = Icons.cancel;
  }
  return Icon(
    data,
    size: iconSize.shortestSide,
  );
}
*/
class PlacesTile extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  const PlacesTile({
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                location.image,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(location.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            // You can add more widgets here to display additional information
          ],
        ),
      ),
    );
  }
}
