import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/itenary_tiles.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart';
import 'package:itinerary_app/pages/timeline_tile.dart';
import 'package:provider/provider.dart';

class ItineraryPage extends StatefulWidget {
  ItineraryPage({super.key});

  final List<ItineraryItem> _itinerary = [
    ItineraryItem(
        name: 'Flight',
        value1: true,
        value2: false,
        value3: true,
        category: 'Nightlife',
        start: '10:00',
        end: '11:00'),
    ItineraryItem(
        name: 'Hotel',
        value1: false,
        value2: false,
        value3: true,
        category: 'Monument',
        start: '11:00',
        end: '12:00'),
    ItineraryItem(
        name: 'Attraction',
        value1: false,
        value2: false,
        value3: true,
        category: 'Park',
        start: '12:00',
        end: '13:00'),
    ItineraryItem(
        name: 'Food',
        value1: false,
        value2: false,
        value3: true,
        category: 'Special Attraction',
        start: '13:00',
        end: '14:00'),
    ItineraryItem(
        name: 'Shopping',
        value1: false,
        value2: false,
        value3: false,
        category: 'Restaurant/Bar',
        start: '14:00',
        end: '15:00'),
    ItineraryItem(
        name: 'Transport',
        value1: false,
        value2: false,
        value3: false,
        category: 'Special Attraction',
        start: '15:00',
        end: '16:00'),
    ItineraryItem(
        name: 'Others',
        value1: false,
        value2: true,
        value3: false,
        category: 'Monument',
        start: '16:00',
        end: '17:00'),
  ];
  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<SelectedPlaces, SavedItineraries>(
      builder: (context, value, SavedItineraries, child) => Scaffold(
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
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: NeumorphicBox(
                          child: IconButton(
                              icon: Icon(Icons.save, size: 25.sp),
                              onPressed: () {
                                List<Location> itineraryList =
                                    value.getSelectedPlaces();

                                // Save the itinerary using the SavedItineraries provider
                                SavedItineraries.addItinerary(itineraryList);
                              })))
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
                            print(value.getSelectedPlaces().length);
                            return MyTimeLineTile(
                              start: widget._itinerary[index].start,
                              end: widget._itinerary[index].end,
                              category: location.category,
                              isFirst: index == 0 ? true : false,
                              isLast:
                                  index == value.getSelectedPlaces().length - 1
                                      ? true
                                      : false,
                              isPast: widget._itinerary[index].value3,
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
