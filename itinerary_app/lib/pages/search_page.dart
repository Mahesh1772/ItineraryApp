import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:itinerary_app/components/places_tile.dart';
import 'package:itinerary_app/pages/itinerary_display_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  SearchPage(
      {super.key,
      required this.startDate,
      required this.startTime,
      required this.endTime});

  late String startDate;
  late String startTime;
  late String endTime;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // To store text being searched
  String searchText = '';

  List<String> categories = [
    'Monument',
    'Park',
    'Nightlife',
    'Special Attraction',
    'Restaurant / Bar',
  ];

  List<bool> isSelectedList =
      List.filled(8, false); // Initialize the list with all false values
  Map<String, List<Location>> groupedMonuments = {};
  String selectedCategory = 'Monument';
  void groupMonuments() {
    // Group monuments based on morning, afternoon, and evening
    for (var monument in monuments) {
      String preferredTime = monument.preferredTime;
      if (!groupedMonuments.containsKey(preferredTime)) {
        groupedMonuments[preferredTime] = [];
      }
      groupedMonuments[preferredTime]!.add(monument);
      groupedMonuments[preferredTime]!
          .sort((a, b) => a.closingTime.compareTo(b.closingTime));
    }
    groupedMonuments.forEach((key, value) {
      value.sort((a, b) => b.priority.compareTo(a.priority));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.startDate);
    print(widget.startTime);
    print(widget.endTime);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      icon: Icon(Icons.brightness_4, size: 30.sp),
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                    ),
                  ),
                ),
              ],
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItineraryPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Show Itinerary Page',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: NeumorphicBox(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.45),
                      fontSize: 18.sp,
                    ),
                    focusColor: Theme.of(context).colorScheme.secondary,
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      size: 30.sp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    prefixIconColor: Theme.of(context).colorScheme.secondary,
                    fillColor: Theme.of(context).colorScheme.primary,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: Text(
                "Search Mode: ",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Container(
                padding: EdgeInsets.all(5.sp),
                margin: EdgeInsets.all(5.sp),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                      spacing: 10.w,
                      children: categories
                          .asMap()
                          .entries
                          .map(
                            (category) => ChoiceChip(
                              elevation: 5,
                              pressElevation: 0,
                              selected: isSelectedList[category.key],
                              label: Text(category.value),
                              labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.sp,
                              ),
                              onSelected: (selected) {
                                setState(() {
                                  isSelectedList = List.filled(
                                      categories.length,
                                      false); // Reset all values to false
                                  isSelectedList[category.key] =
                                      selected; // Set the selected value to true for the chosen category

                                  print(selectedCategory);
                                });
                              },
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          )
                          .toList()),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: Text(
                "Places",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: GridView.builder(
                itemCount: monuments.length,
                padding: EdgeInsets.all(12.sp),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.1.w / 1.5.h),
                itemBuilder: (context, index) {
                  return PlacesTile(
                    location: monuments[index],
                    onTap: () {
                      _showPlaceDetails(context, monuments[index]); 
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  void _showPlaceDetails(BuildContext context, Location place) { 
    showDialog( 
      context: context, 
      builder: (BuildContext context) { 
        return AlertDialog( 
          title: Text(place.name), 
          content: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            mainAxisSize: MainAxisSize.min, 
            children: [ 
              Text('Location: ${place.location}'), 
              Text('Description: ${place.description}'), 
              // ... add other fields as needed 
            ], 
          ), 
          actions: [ 
            TextButton( 
              onPressed: () { 
                Navigator.of(context).pop(); 
              }, 
              child: Text('Close'), 
            ), 
          ], 
        ); 
      }, 
    ); 
  } 
