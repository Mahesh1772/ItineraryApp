import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:intl/intl.dart';
import 'package:itinerary_app/pages/search_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.startDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  State<HomePage> createState() => _HomePageState();

  late String startDate;
  late String startTime;
  late String endTime;
}

class _HomePageState extends State<HomePage> {
  void _showStartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context)
                    .colorScheme
                    .secondary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        if (value != null) {
          widget.startDate = DateFormat('d MMM yyyy').format(value);
        }
      });
    });
  }

  void _showStartTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: (Theme.of(context).colorScheme.background ==
                      const Color.fromARGB(255, 243, 246, 254))
                  ? ColorScheme.highContrastLight(
                      primary: const Color.fromARGB(
                          255, 129, 71, 230), // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: Theme.of(context)
                          .colorScheme
                          .tertiary, // <-- SEE HERE
                    )
                  : ColorScheme.highContrastDark(
                      primary: const Color.fromARGB(
                          255, 129, 71, 230), // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: Theme.of(context)
                          .colorScheme
                          .tertiary, // <-- SEE HERE
                    ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context)
                      .colorScheme
                      .tertiary, // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    ).then(
      ((value) {
        setState(
          () {
            if (value != null) {
              DateTime now = DateTime.now();
              DateTime dt = DateTime(
                  now.year, now.month, now.day, value.hour, value.minute);

              widget.startTime = DateFormat.jm().format(dt);
            }
          },
        );
      }),
    );
  }

  void _showEndTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: (Theme.of(context).colorScheme.background ==
                      const Color.fromARGB(255, 243, 246, 254))
                  ? ColorScheme.highContrastLight(
                      primary: const Color.fromARGB(
                          255, 129, 71, 230), // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: Theme.of(context)
                          .colorScheme
                          .tertiary, // <-- SEE HERE
                    )
                  : ColorScheme.highContrastDark(
                      primary: const Color.fromARGB(
                          255, 129, 71, 230), // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: Theme.of(context)
                          .colorScheme
                          .tertiary, // <-- SEE HERE
                    ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context)
                      .colorScheme
                      .tertiary, // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    ).then(
      ((value) {
        setState(
          () {
            if (value != null) {
              DateTime now = DateTime.now();
              DateTime dt = DateTime(
                  now.year, now.month, now.day, value.hour, value.minute);

              widget.endTime = DateFormat.jm().format(dt);
            }
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key("startSearch"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SearchPage(
                  startDate: widget.startDate,
                  startTime: widget.startTime,
                  endTime: widget.endTime,
                );
              },
            ),
          );
        },
        child: Icon(
          Icons.navigate_next,
          size: 30.sp,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: NeumorphicBox(
                child: IconButton(
                  icon: Icon(Icons.brightness_4, size: 30.sp),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text(
                    "a new world.",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: InkWell(
                key: const Key("conductDate"),
                onTap: () {
                  _showStartDatePicker();
                },
                child: NeumorphicBox(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            child: AutoSizeText(
                              widget.startDate,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Icon(Icons.date_range_rounded,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    key: const Key("startTime"),
                    onTap: () {
                      _showStartTimePicker();
                    },
                    child: NeumorphicBox(
                      child: Container(
                        width: 200.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              child: AutoSizeText(
                                widget.startTime,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Icon(Icons.access_time_filled_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    key: const Key("endTime"),
                    onTap: () {
                      _showEndTimePicker();
                    },
                    child: NeumorphicBox(
                      child: Container(
                        width: 200.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              child: AutoSizeText(
                                widget.endTime,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Icon(Icons.access_time_filled_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
