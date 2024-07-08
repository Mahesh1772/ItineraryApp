# Itinerary App

This Flutter application helps users plan, save, and view itineraries. It includes features for selecting dates and times, adding locations, and saving itineraries for future reference.

## Table of Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [File Structure](#file-structure)
- [Code Overview](#code-overview)
  - [main.dart](#maindart)
  - [home_page.dart](#home_pagedart)
  - [search_page.dart](#search_pagedart)
  - [itinerary_page.dart](#itinerary_pagedart)
  - [history_page.dart](#history_pagedart)
  - [saveditinerary_provider.dart](#saveditinerary_providerdart)
  - [selected_places.dart](#selected_placesdart)
  - [location_class.dart](#location_classdart)
  - [neumorphic_box.dart](#neumorphic_boxdart)
  - [itenary_tiles.dart](#itenary_tilesdart)
  - [timeline_tile.dart](#timeline_tiledart)
  - [theme_provider.dart](#theme_providerdart)
- [How to Use](#how-to-use)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Home Page**: Allows users to select a start date, start time, and end time. Navigation to the search page is enabled once these fields are filled.
- **Search Page**: Users can search for locations and add them to their selected places list.
- **Itinerary Page**: Displays the selected places with their corresponding times.
- **History Page**: Lists all saved itineraries for the user to view.

## Dependencies

- `flutter`
- `provider`
- `intl`
- `flutter_screenutil`
- `auto_size_text`

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/itinerary_app.git
    cd itinerary_app
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the application**:
    ```bash
    flutter run
    ```

## File Structure

```plaintext
lib/
├── components/
│   ├── itenary_tiles.dart
│   ├── location_class.dart
│   ├── neumorphic_box.dart
├── models/
│   ├── selected_places.dart
├── pages/
│   ├── history_page.dart
│   ├── home_page.dart
│   ├── itinerary_page.dart
│   ├── saveditinerary_provider.dart
│   ├── search_page.dart
│   ├── timeline_tile.dart
├── themes/
│   ├── theme_provider.dart
└── main.dart
```

## Code Overview

### `main.dart`

- The entry point of the application.
- Sets up the `ChangeNotifierProvider` for `SelectedPlaces` and `SavedItineraries`.

### `home_page.dart`

- **Purpose**: Allows users to select a start date, start time, and end time.
- **Key Widgets**:
  - `showDatePicker`: Selects the start date.
  - `showTimePicker`: Selects the start and end times.
  - `FloatingActionButton`: Navigates to the `SearchPage`.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart';
import 'package:itinerary_app/pages/home_page.dart';
import 'package:itinerary_app/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedPlaces()),
        ChangeNotifierProvider(create: (_) => SavedItineraries()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => MaterialApp(
        theme: themeProvider.getThemeData,
        home: HomePage(
          startDate: '',
          startTime: '',
          endTime: '',
        ),
      ),
    );
  }
}
```

### `home_page.dart`

- **Purpose**: Allows users to select a start date, start time, and end time.
- **Key Widgets**:
  - `showDatePicker`: Selects the start date.
  - `showTimePicker`: Selects the start and end times.
  - `FloatingActionButton`: Navigates to the `SearchPage`.

### `search_page.dart`

- **Purpose**: Users can search for locations and add them to their selected places list.
- **Key Widgets**:
  - `TextField`: Allows users to input search queries.
  - `ListView.builder`: Displays search results.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/components/location_class.dart';
import 'package:itinerary_app/pages/itinerary_page.dart';

class SearchPage extends StatefulWidget {
  final String startDate;
  final String startTime;
  final String endTime;

  SearchPage({
    required this.startDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Location> _searchResults = [];

  void _search(String query) {
    // Perform search logic here and update _searchResults
    // This is just a placeholder implementation
    setState(() {
      _searchResults = [
        Location(name: 'Location 1', address: 'Address 1'),
        Location(name: 'Location 2', address: 'Address 2'),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Locations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _search(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Location location = _searchResults[index];
                return ListTile(
                  title: Text(location.name),
                  subtitle: Text(location.address),
                  onTap: () {
                    Provider.of<SelectedPlaces>(context, listen: false)
                        .addPlace(location);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItineraryPage(
                          startDate: widget.startDate,
                          startTime: widget.startTime,
                          endTime: widget.endTime,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

### `itinerary_page.dart`

- **Purpose**: Displays the selected places with their corresponding times.
- **Key Widgets**:
  - `ListView.builder`: Lists all selected places with their times.
  - `MyTimeLineTile`: Custom widget to display each location.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itinerary_app/models/selected_places.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart';
import 'package:itinerary_app/components/timeline_tile.dart';

class ItineraryPage extends StatelessWidget {
  final String startDate;
  final String startTime;
  final String endTime;

  ItineraryPage({
    required this.startDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itinerary'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Provider.of<SavedItineraries>(context, listen: false)
                  .addItinerary(Provider.of<SelectedPlaces>(context, listen: false).places);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Consumer<SelectedPlaces>(
        builder: (context, selectedPlaces, child) {
          return ListView.builder(
            itemCount: selectedPlaces.places.length,
            itemBuilder: (context, index) {
              return MyTimeLineTile(
                location: selectedPlaces.places[index],
              );
            },
          );
        },
      ),
    );
  }
}
```

### `history_page.dart`

- **Purpose**: Displays all saved itineraries.
- **Key Widgets**:
  - `ListView.builder`: Lists all saved itineraries.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itinerary_app/pages/saveditinerary_provider.dart';
import 'package:itinerary_app/components/location_class.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedItineraries>(
      builder: (context, savedItineraries, child) => Scaffold(
        appBar: AppBar(
          title: Text("Saved Itineraries"),
        ),
        body: ListView.builder(
          itemCount: savedItineraries.itineraries.length,
          itemBuilder: (context, index) {
            List<Location> itinerary = savedItineraries.itineraries[index];
            return ListTile(
              title: Text("Itinerary ${index + 1}"),
              onTap: () {
                // You can add navigation to a detailed itinerary view if needed
              },
            );
          },
        ),
      ),
    );
  }
}
```

### `saveditinerary_provider.dart`

- **Purpose**: Manages the list of saved itineraries.
- **Key Methods**:
  - `addItinerary(List<Location> itinerary)`: Adds a new itinerary to the list and notifies listeners.

```dart
import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class SavedItineraries extends ChangeNotifier {
  List<List<Location>> _itineraries = [];

  List<List<Location>> get itineraries => _itineraries;

  void addItinerary(List<Location> itinerary) {
    _itineraries.add(itinerary);
    notifyListeners();
  }
}
```

### `selected_places.dart`

- **Purpose**: Manages the list of selected places.
- **Key Methods**:
  - `addPlace(Location place)`: Adds a new place to the list.
  - `removePlace(Location place)`: Removes a place from the list.

```dart
import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class SelectedPlaces extends ChangeNotifier {
  List<Location> _places = [];

  List<Location> get places => _places;

  void addPlace(Location place) {
    _places.add(place);
    notifyListeners();
  }

  void removePlace(Location place) {
    _places.remove(place);
    notifyListeners();
  }
}
```

### `location_class.dart`

- **Purpose**: Defines the `Location` class used for representing places.

```dart
class Location {
  final String name;
  final String address;

  Location({required this.name, required this.address});
}
```

### `neumorphic_box.dart`

- **Purpose**: A custom widget for a neumorphic style box used in the UI.



```dart
import 'package:flutter/material.dart';

class NeumorphicBox extends StatelessWidget {
  final Widget child;

  NeumorphicBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
```

### `itenary_tiles.dart`

- **Purpose**: Custom widget to display each itinerary tile.

```dart
import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class ItenaryTile extends StatelessWidget {
  final Location location;

  ItenaryTile({required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.name),
      subtitle: Text(location.address),
    );
  }
}
```

### `timeline_tile.dart`

- **Purpose**: Custom widget to display each location in the itinerary with a timeline style.

```dart
import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class MyTimeLineTile extends StatelessWidget {
  final Location location;

  MyTimeLineTile({required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text(location.name),
      subtitle: Text(location.address),
    );
  }
}
```

### `theme_provider.dart`

- **Purpose**: Manages theme changes (light and dark mode).
- **Key Methods**:
  - `toggleTheme()`: Toggles between light and dark themes.

```dart
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider()
      : _themeData = ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            secondary: Colors.blue,
            background: Colors.grey[200]!,
            tertiary: Colors.blue[800]!,
          ),
        );

  ThemeData get getThemeData => _themeData;

  void toggleTheme() {
    if (_themeData.brightness == Brightness.light) {
      _themeData = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          secondary: Colors.teal,
          background: Colors.grey[850]!,
          tertiary: Colors.teal[700]!,
        ),
      );
    } else {
      _themeData = ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          secondary: Colors.blue,
          background: Colors.grey[200]!,
          tertiary: Colors.blue[800]!,
        ),
      );
    }
    notifyListeners();
  }
}
```

## How to Use

1. **Select Date and Time**:
   - On the home page, select the start date, start time, and end time.
   - Click the next button to proceed to the search page.

2. **Search for Locations**:
   - On the search page, enter the location name in the search bar and click the search icon.
   - Select a location from the search results to add it to your itinerary.

3. **View and Save Itinerary**:
   - On the itinerary page, view the selected locations and their corresponding times.
   - Click the save icon to save the itinerary.

4. **View Saved Itineraries**:
   - Navigate to the history page to view all saved itineraries.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or enhancements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
