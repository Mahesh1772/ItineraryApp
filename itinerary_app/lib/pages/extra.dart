import 'package:flutter/material.dart';
import 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, List<Map<String, dynamic>>> groupedMonuments = {};

  List<Map<String, dynamic>> itinerary = [];

  @override
  void initState() {
    super.initState();
    groupMonuments();
    generateItinerary();
  }

  void groupMonuments() {
    // Group monuments based on morning, afternoon, and evening
    for (var monument in monuments) {
      String preferredTime = monument['preferredTime'];
      if (!groupedMonuments.containsKey(preferredTime)) {
        groupedMonuments[preferredTime] = [];
      }
      groupedMonuments[preferredTime]!.add(monument);
      groupedMonuments[preferredTime]!
          .sort((a, b) => a['closingTime'].compareTo(b['closingTime']));
    }
    groupedMonuments.forEach((key, value) {
      value.sort((a, b) => b['priority'].compareTo(a['priority']));
    });
  }

  void generateItinerary() {
    // Create an itinerary based on the visiting hours and duration
    DateTime currentTime = DateTime.now();

    for (var timeOfDay in groupedMonuments.keys) {
      List<Map<String, dynamic>> monuments = groupedMonuments[timeOfDay] ?? [];

      for (var monument in monuments) {
        String name = monument['name'];
        String location = monument['location'];
        String preferredTime = monument['preferredTime'];
        String visitingHours = monument['visitingHours'];
        int duration = monument['duration'] ?? 0; // Duration in hours
        String image = monument['image'];
        DateTime startTime = currentTime;

        // Parse visiting hours to get the start and end times

        DateTime endTime = currentTime.add(Duration(hours: duration));
        String endTimeString =
            '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
        itinerary.add({
          'name': name,
          'location': location,
          'preferredTime': preferredTime,
          'visitingHours': visitingHours,
          'duration': duration,
          'startTime': startTime,
          'endTime': endTimeString,
          'image': image,
        });

        currentTime = endTime;
      }
    }
  }

  void removeFromItinerary(int index) {
    setState(() {
      itinerary.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attractions by time of day'),
      ),
      body: ListView.builder(
        itemCount: itinerary.length,
        itemBuilder: (context, index) {
          String name = itinerary[index]['name'];
          String location = itinerary[index]['location'];
          String preferredTime = itinerary[index]['preferredTime'];
          String visitingHours = itinerary[index]['visitingHours'];
          int duration = itinerary[index]['duration'];
          DateTime startTime = itinerary[index]['startTime'];
          String endTime = itinerary[index]['endTime'];
          String image = itinerary[index]['image'];

          return buildItineraryCard(
            name,
            location,
            preferredTime,
            visitingHours,
            duration,
            startTime,
            endTime,
            index,
            image,
          );
        },
      ),
    );
  }

  Widget buildItineraryCard(
    String name,
    String location,
    String preferredTime,
    String visitingHours,
    int duration,
    DateTime startTime,
    String endTime,
    int index,
    String image,
  ) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Name: $name'),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.95,
                child: Wrap(
                  children: [
                    Image.network(image),
                    ListTile(
                      leading: Icon(Icons.my_location),
                      title: Text('Location: $location'),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text('Preferred Time: $preferredTime'),
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Visiting Hours: $visitingHours'),
                    ),
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text('Duration: $duration hours'),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text(
                          'Start Time: ${startTime.hour}:${startTime.minute}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.timer_off),
                      title: Text('End Time: ${endTime}'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: $location'),
            Text('Preferred Time: $preferredTime'),
            Text('Visiting Hours: $visitingHours'),
            Text('Duration: $duration hours'),
            Text('Start Time: ${startTime.hour}:${startTime.minute}'),
            Text('End Time: ${endTime}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () => removeFromItinerary(index),
        ),
      ),
    );
  }
}
