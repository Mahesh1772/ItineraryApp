import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itinerary_app/components/neumorphic_box.dart';

class ItineraryTile extends StatelessWidget {
  final String itinerary;
  final String start;
  final String end;
  // list of colors for the tiles
  final List<Color> colors = [
    Colors.deepPurple,
    Colors.green.shade800,
    Colors.red.shade900,
    Colors.blue.shade900,
    Colors.black54,
  ];

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Monument':
        return colors[0];
      case 'Park':
        return colors[1];
      case 'Nightlife':
        return colors[2];
      case 'Special Attraction':
        return colors[3];
      case 'Places to eat':
        return colors[4];
      default:
        return Colors.black; // Default color for unknown categories
    }
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'Monument':
        return Icons.account_balance;
      case 'Park':
        return Icons.nature_people;
      case 'Nightlife':
        return Icons.nightlife;
      case 'Special Attraction':
        return Icons.attractions;
      case 'Places to eat':
        return Icons.restaurant;
      default:
        return Icons.help; // Default icon for unknown categories
    }
  }

  final String category;
  ItineraryTile({super.key, required this.itinerary, required this.category, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    final Color color = getCategoryColor(category);
    final IconData icon = getCategoryIcon(category);
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 10,
        top: 10,
      ),
      child: NeumorphicBox(
        child: Center(
          child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              title: Text(
                itinerary,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(category),
              trailing: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Aligns the times vertically
                children: [
                  Text(
                    start, // Start time
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    size: 15, // Two-way arrow
                    color: Colors.black,
                  ),
                  Text(
                    end, // End time
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
