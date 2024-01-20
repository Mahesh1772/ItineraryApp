import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:itinerary_app/components/places_tile.dart';
import 'package:itinerary_app/pages/itinerary_display_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // To store text being searched
  String searchText = '';

  List<String> categories = [
    'Name',
    'Rank',
    'Company',
    'Section',
    'Platoon',
    'Ration',
    'Blood',
    'Appointment',
  ];

  List<bool> isSelectedList =
      List.filled(8, false); // Initialize the list with all false values

  String selectedCategory = 'name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    "a new world",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const ItineraryPage(),
            //       ),
            //     );
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.primary,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     padding: const EdgeInsets.all(20),
            //     child: Center(
            //       child: Text(
            //         'Show Itinerary Page',
            //         style: TextStyle(
            //           fontSize: 24,
            //           color: Theme.of(context).colorScheme.secondary,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

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
                itemCount: 3,
                padding: EdgeInsets.all(12.sp),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.2.w / 1.5.h),
                itemBuilder: (context, index) {
                  return PlacesTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
