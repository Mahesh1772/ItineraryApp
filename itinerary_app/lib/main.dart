import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart'; // Import the SavedItineraries class
import 'package:itinerary_app/pages/home_page.dart';
import 'package:itinerary_app/pages/search_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SelectedPlaces()),
        ChangeNotifierProvider(
            create: (context) => SavedItineraries()), // Add this line
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false, // remove debug banner
        home: HomePage(
          startDate: "Date:",
          startTime: "Start Time:",
          endTime: "End Time:",
        ),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
      designSize: const Size(450, 1000),
    );
  }
}
