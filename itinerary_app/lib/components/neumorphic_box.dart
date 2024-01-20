import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeumorphicBox extends StatelessWidget {
  const NeumorphicBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: [
          //darker shadow on the bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4.w, 4.h),
            blurRadius: 15.r,
          ),

          //lighter shadow on the top left
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.w, -4.h),
            blurRadius: 15.r,
          ),
        ],
      ),
      padding: EdgeInsets.all(4.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: [
            //darker shadow on the bottom right
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(2.w, 2.h),
              blurRadius: 15.r,
            ),

            //lighter shadow on the top left
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2.w, -2.h),
              blurRadius: 15.r,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
