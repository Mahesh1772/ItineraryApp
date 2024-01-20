import 'package:flutter/material.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';
import 'package:itinerary_app/pages/itinerary_display_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Itinerary App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  "a new world",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 35,
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

          Center(child: NeumorphicBox(child: Icon(Icons.search))),
        ],
      ),
    );
  }
}
