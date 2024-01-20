import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> monuments = [
    // Monuments
    {
      'category': 'Monument',
      'name': 'Merlion Park',
      'location': 'Fullerton Road, Singapore',
      'visitingHours': '00:00 - 23:00',
      'closingTime': '24:00',
      'description': 'Iconic statue of a mythical creature with a lion\'s head and a fish\'s tail, overlooking Marina Bay.',
      'price': 0,
      'reviews': ['Amazing view!', 'Must-visit landmark.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Monument',
      'name': 'Sri Mariamman Temple',
      'location': '244 South Bridge Road, Singapore',
      'visitingHours': '07:00 - 12:00',
      'closingTime': '21:00',
      'description': 'Oldest Hindu temple in Singapore, known for its stunning Dravidian architecture and intricate sculptures.',
      'price': 0,
      'reviews': ['Beautiful architecture!', 'Spiritual experience.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Monument',
      'name': 'National Museum of Singapore',
      'location': '93 Stamford Road, Singapore',
      'visitingHours': '10:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Museum showcasing the history and culture of Singapore through interactive exhibits and artifacts.',
      'price': 15,
      'reviews': ['Educational and engaging!', 'Rich collection.'],
      'preferredTime': 'Afternoon',
      'priority': '2',
    },
    {
      'category': 'Monument',
      'name': 'Singapore Art Museum',
      'location': '71 Bras Basah Road, Singapore',
      'visitingHours': '10:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Contemporary art museum housed in a restored 19th-century school building.',
      'price': 12,
      'reviews': ['Art lover\'s paradise!', 'Diverse exhibitions.'],
      'preferredTime': 'Afternoon',
      'priority': '2',
    },
    {
      'category': 'Monument',
      'name': 'Esplanade - Theatres on the Bay',
      'location': '1 Esplanade Drive, Singapore',
      'visitingHours': '10:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Iconic performing arts center with theaters, concert halls, and waterfront views.',
      'price': 0,
      'reviews': ['Cultural hub!', 'Impressive architecture.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Monument',
      'name': 'Fort Siloso',
      'location': 'Siloso Road, Sentosa, Singapore',
      'visitingHours': '10:00 - 18:00',
      'closingTime': '18:00',
      'description': 'Historical coastal fort with exhibits, tunnels, and panoramic views of the sea.',
      'price': 12,
      'reviews': ['Rich history!', 'Great for history buffs.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Monument',
      'name': 'Civilian War Memorial',
      'location': 'Beach Road, Singapore',
      'visitingHours': '00:00 - 24:00',
      'closingTime': '24:00',
      'description': 'Memorial honoring civilians who perished during the Japanese occupation of Singapore.',
      'price': 0,
      'reviews': ['Solemn tribute!', 'Quiet reflection.'],
      'preferredTime': 'Full Day',
      'priority': '4',
    },
    // Add more monuments...

    // Special Attractions
    {
      'category': 'Special Attraction',
      'name': 'Gardens by the Bay',
      'location': '18 Marina Gardens Drive, Singapore',
      'visitingHours': '09:00 - 21:00',
      'closingTime': '21:00',
      'description': 'Futuristic park featuring the iconic Supertree Grove, Flower Dome, and Cloud Forest.',
      'price': 0,
      'reviews': ['Breathtaking views!', 'Must-see attractions.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Special Attraction',
      'name': 'Sentosa Island',
      'location': 'Sentosa, Singapore',
      'visitingHours': '09:00 - 21:00',
      'closingTime': '21:00',
      'description': 'Popular resort island with attractions like Universal Studios, S.E.A. Aquarium, and Adventure Cove Waterpark.',
      'price': 0,
      'reviews': ['Fun-filled island!', 'Great for families.'],
      'preferredTime': 'Full Day',
      'priority': '4',
    },
    {
      'category': 'Special Attraction',
      'name': 'Singapore Flyer',
      'location': '30 Raffles Avenue, Singapore',
      'visitingHours': '08:30 - 22:30',
      'closingTime': '22:30',
      'description': 'Giant Ferris wheel offering panoramic views of the city skyline and beyond.',
      'price': 33,
      'reviews': ['Spectacular views!', 'Romantic experience.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Special Attraction',
      'name': 'ArtScience Museum',
      'location': '6 Bayfront Avenue, Singapore',
      'visitingHours': '10:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Futuristic museum with innovative exhibits blending art, science, and technology.',
      'price': 21,
      'reviews': ['Inspiring exhibits!', 'Family-friendly.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Special Attraction',
      'name': 'Haw Par Villa',
      'location': '262 Pasir Panjang Road, Singapore',
      'visitingHours': '09:00 - 18:00',
      'closingTime': '18:00',
      'description': 'Theme park showcasing Chinese mythology through vibrant sculptures and dioramas.',
      'price': 0,
      'reviews': ['Unique experience!', 'Cultural exploration.'],
      'preferredTime': 'Afternoon',
      'priority': '2',
    },
    {
      'category': 'Special Attraction',
      'name': 'National Gallery Singapore',
      'location': '1 St. Andrew\'s Road, Singapore',
      'visitingHours': '10:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Art museum housed in two national monuments, showcasing Singaporean and Southeast Asian art.',
      'price': 20,
      'reviews': ['Artistic masterpiece!', 'Cultural immersion.'],
      'preferredTime': 'Afternoon',
      'priority': '2',
    },
    {
      'category': 'Special Attraction',
      'name': 'Singapore Discovery Centre',
      'location': '510 Upper Jurong Road, Singapore',
      'visitingHours': '09:00 - 18:00',
      'closingTime': '18:00',
      'description': 'Interactive museum with exhibits on Singapore\'s history, defense, and technological advancements.',
      'price': 18,
      'reviews': ['Educational and fun!', 'Great for families.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    // Add more special attractions...

    // Parks
    {
      'category': 'Park',
      'name': 'Singapore Botanic Gardens',
      'location': '1 Cluny Road, Singapore',
      'visitingHours': '05:00 - 00:00',
      'closingTime': '00:00',
      'description': 'Lush, expansive garden with themed sections, including the National Orchid Garden.',
      'price': 0,
      'reviews': ['Green oasis!', 'Perfect for nature lovers.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Park',
      'name': 'East Coast Park',
      'location': 'East Coast Park Service Road, Singapore',
      'visitingHours': '00:00 - 24:00',
      'closingTime': '24:00',
      'description': 'Scenic coastal park with beaches, cycling paths, and recreational facilities.',
      'price': 0,
      'reviews': ['Beachside fun!', 'Great for outdoor activities.'],
      'preferredTime': 'Full Day',
      'priority': '4',
    },
    {
      'category': 'Park',
      'name': 'Bishan-Ang Mo Kio Park',
      'location': '1384 Ang Mo Kio Avenue 1, Singapore',
      'visitingHours': '07:00 - 00:00',
      'closingTime': '00:00',
      'description': 'Scenic park with water features, playgrounds, and a riverside promenade.',
      'price': 0,
      'reviews': ['Relaxing atmosphere!', 'Great for picnics.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Park',
      'name': 'Labrador Nature Reserve',
      'location': 'Labrador Villa Road, Singapore',
      'visitingHours': '07:00 - 19:00',
      'closingTime': '19:00',
      'description': 'Nature reserve with historical relics, coastal trails, and lush greenery.',
      'price': 0,
      'reviews': ['Serene nature walk!', 'Historical interest.'],
      'preferredTime': 'Afternoon',
      'priority': '2',
    },
    {
      'category': 'Park',
      'name': 'HortPark',
      'location': '33 Hyderabad Road, Singapore',
      'visitingHours': '06:00 - 22:00',
      'closingTime': '22:00',
      'description': 'One-stop gardening hub with themed gardens, plant displays, and horticultural events.',
      'price': 0,
      'reviews': ['Botanical delight!', 'Perfect for plant enthusiasts.'],
      'preferredTime': 'Morning',
      'priority': '1',
    },
    {
      'category': 'Park',
      'name': 'West Coast Park',
      'location': 'West Coast Highway, Singapore',
      'visitingHours': '00:00 - 24:00',
      'closingTime': '24:00',
      'description': 'Recreational park with playgrounds, cycling paths, and waterfront views along West Coast Beach.',
      'price': 0,
      'reviews': ['Family-friendly!', 'Relaxing atmosphere.'],
      'preferredTime': 'Full Day',
      'priority': '4',
    },
    // Add more parks...

    // Nightlife
    {
      'category': 'Nightlife',
      'name': 'Clarke Quay',
      'location': 'River Valley Road, Singapore',
      'visitingHours': '21:00 - 05:00',
      'closingTime': '05:00',
      'description': 'Riverside quay with a vibrant nightlife scene, featuring bars, restaurants, and nightclubs.',
      'price': 0,
      'reviews': ['Lively atmosphere!', 'Great for partygoers.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Nightlife',
      'name': 'Zouk Singapore',
      'location': '3C River Valley Road, Clarke Quay, Singapore',
      'visitingHours': '22:00 - 04:00',
      'closingTime': '04:00',
      'description': 'Renowned nightclub with multiple dance floors and a diverse range of music genres.',
      'price': 30,
      'reviews': ['Legendary club!', 'Fantastic DJ lineup.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Nightlife',
      'name': 'Holland Village',
      'location': 'Holland Avenue, Singapore',
      'visitingHours': '22:00 - 04:00',
      'closingTime': '04:00',
      'description': 'Bohemian neighborhood with a variety of bars, pubs, and live music venues.',
      'price': 0,
      'reviews': ['Lively nightlife!', 'Local charm.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Nightlife',
      'name': '1-Altitude Gallery & Bar',
      'location': '1 Raffles Place, Singapore',
      'visitingHours': '15:00 - 22:00',
      'closingTime': '22:00',
      'description': 'Tallest rooftop bar in Singapore with stunning views of the city skyline.',
      'price': 35,
      'reviews': ['Unbeatable views!', 'Chic ambiance.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    {
      'category': 'Nightlife',
      'name': 'Marina Bay Sands Casino',
      'location': '10 Bayfront Avenue, Singapore',
      'visitingHours': '00:00 - 24:00',
      'closingTime': '24:00',
      'description': 'World-class casino located at the iconic Marina Bay Sands complex.',
      'price': 0,
      'reviews': ['Exciting gaming!', 'Luxurious experience.'],
      'preferredTime': 'Night',
      'priority': '3',
    },
    // Add more nightlife locations...
  ];

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
      value.sort((a, b) => b['preferredTime'].compareTo(a['preferredTime']));
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
        List<String> hours = visitingHours.split(' - ');
        DateTime startVisitingTime = DateTime(
          startTime.year,
          startTime.month,
          startTime.day,
          int.parse(hours[0].split(':')[0]),
          int.parse(hours[0].split(':')[1]),
        );
        DateTime endVisitingTime = DateTime(
          startTime.year,
          startTime.month,
          startTime.day,
          int.parse(hours[1].split(':')[0]),
          int.parse(hours[1].split(':')[1]),
        );

        DateTime endTime = endVisitingTime.isAfter(startTime)
            ? endVisitingTime
            : endVisitingTime.add(Duration(days: 1));

        itinerary.add({
          'name': name,
          'location': location,
          'preferredTime': preferredTime,
          'visitingHours': visitingHours,
          'duration': duration,
          'startTime': startTime,
          'endTime': endTime,
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
          DateTime endTime = itinerary[index]['endTime'];
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
    DateTime endTime,
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
                height: MediaQuery.of(context).size.height*0.95,
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
                    title: Text('Start Time: ${startTime.hour}:${startTime.minute}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer_off),
                    title: Text('End Time: ${endTime.hour}:${endTime.minute}'),
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
            Text('End Time: ${endTime.hour}:${endTime.minute}'),
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
