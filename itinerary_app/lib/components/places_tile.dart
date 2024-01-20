import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

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
      child: NeumorphicBox(
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      location.image,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: AutoSizeText(
                              location.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: AutoSizeText(
                              location.category,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Icon(Icons.wb_sunny_outlined, size: 30.sp),
                        ],
                      ),
                    ],
                  ),
                  // You can add more widgets here to display additional information
                ],
              ),
              Row(
                children: [
                  //Icon(Icons.wb_sunny_outlined, size: 30.sp),
                  //SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(top: 215.0.h, left: 150.0.w),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
