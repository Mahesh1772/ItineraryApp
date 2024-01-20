import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';

class PlacesTile extends StatelessWidget {
  const PlacesTile({super.key});

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
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
