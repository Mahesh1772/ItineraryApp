import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itinerary_app/components/itenary_tiles.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:itinerary_app/pages/timeline_tile.dart';
import 'package:provider/provider.dart';

class ItineraryPage extends StatefulWidget {
  ItineraryPage(
      {super.key,
      required this.startDate,
      required this.startTime,
      required this.endTime});

  final String startDate;
  final String startTime;
  final String endTime;

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  @override
  Widget build(BuildContext context) {
    var currentStartTime;
    /*
    String addHoursToTime(String time, int hours) {
      // Convert the time string to an integer
      if (time.length != 5) {
        time = "0" + time;
      }
      print(time);

      DateTime originalTime = DateTime.parse("2022-01-01 " + time + ":00");

      // Add the hours to the time
      DateTime newTime = originalTime.add(Duration(minutes: hours * 60));

      // Format the resulting time into the original time string format
      String formattedTime =
          "${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}";

      return formattedTime;
    }*/

    final List itineraryItems = [
      ['1000', '1100'],
      ['1100', '1300'],
      ['1300', '1400'],
      ['1400', '1700'],
      ['1700', '1900'],
      ['0700', '0800'],
    ];

    return Consumer<SelectedPlaces>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: NeumorphicBox(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, size: 25.sp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SizedBox(
                  height: 850.h,
                  child: value.getSelectedPlaces().length == 0
                      ? Center(
                          child: Text(
                            'No places selected!',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.getSelectedPlaces().length,
                          itemBuilder: (context, index) {
                            //get individual place
                            Location location =
                                value.getSelectedPlaces()[index];

                            /*
                            if (index == 0) {
                              currentStartTime = //widget.startTime;
                                  addHoursToTime(widget.startTime, 0);
                            } else {
                              currentStartTime = addHoursToTime(
                                  value.getSelectedPlaces()[index - 1].endTime,
                                  0);
                            }*/

                            // print("Current start time: " +
                            // currentStartTime.toString() +
                            // " for " +
                            // location.name +
                            // " with duration " +
                            // location.duration.toString() +
                            // " hours");
                            return MyTimeLineTile(
                              start: itineraryItems[index][0],
                              end: itineraryItems[index][1],
                              category: location.category,
                              isFirst: index == 0 ? true : false,
                              isLast:
                                  index == value.getSelectedPlaces().length - 1
                                      ? true
                                      : false,
                              isPast: true,
                              itinerary: location.name,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
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
  final String category;
  final String start;
  final String end;
  ItineraryItem({
    required this.name,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.category,
    required this.start,
    required this.end,
  });
}
