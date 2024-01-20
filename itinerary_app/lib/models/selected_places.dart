import 'package:flutter/material.dart';
import 'package:itinerary_app/components/location_class.dart';

class SelectedPlaces extends ChangeNotifier {
  //list of places
  List<Location> _places = [
    Location(
      category: 'Places to eat',
      name: 'Maxwell Food Centre',
      location: '1 Kadayanallur Street, Singapore',
      visitingHours: '10:00 - 21:00',
      closingTime: '21:00',
      description:
          'Hawker center offering a variety of local dishes, including Hainanese chicken rice and laksa.',
      price: 30,
      reviews: ['Amazing view!', 'Must-visit restaurant.'],
      preferredTime: 'Afternoon',
      priority: '2',
      duration: 1,
      image:
          'https://images.unsplash.com/photo-1581601442673-c3370bb99d8d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWF4d2VsbCUyMGhhd2tlciUyMGNlbnRlcnxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Location(
      category: 'Places to eat',
      name: 'Chinatown Complex Food Centre',
      location: '335 Smith Street, Singapore',
      visitingHours: '10:00 - 21:00',
      closingTime: '21:00',
      description:
          'Large hawker center in Chinatown with a wide array of affordable and delicious local food options.',
      price: 10,
      reviews: ['Amazing food!', 'Must-visit restaurant.'],
      preferredTime: 'Evening',
      priority: '3',
      duration: 1,
      image:
          'https://images.unsplash.com/photo-1494211870102-df67df81b14c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hpbmF0b3duJTIwc2luZ2Fwb3JlfGVufDB8fDB8fHww',
    ),
    Location(
      category: 'Places to eat',
      name: 'Newton Food Centre',
      location: '500 Clemenceau Avenue North, Singapore',
      visitingHours: '10:00 - 21:00',
      closingTime: '21:00',
      description:
          'Popular open-air hawker center known for its seafood and local delights.',
      price: 10,
      reviews: ['Amazing Food!', 'Must-visit restaurant.'],
      preferredTime: 'Evening',
      priority: '3',
      duration: 1,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Newton_Food_Centre_3%2C_Aug_06.JPG/1200px-Newton_Food_Centre_3%2C_Aug_06.JPG',
    ),
    // Monuments
    Location(
      category: 'Monument',
      name: 'Merlion Park',
      location: 'Fullerton Road, Singapore',
      visitingHours: '00:00 - 23:00',
      closingTime: '23:00',
      description:
          'Iconic statue of a mythical creature with a lion\'s head and a fish\'s tail, overlooking Marina Bay.',
      price: 0,
      reviews: ['Amazing view!', 'Must-visit landmark.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 1,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/2/2e/Singapore_Skyline_2019-10.jpg',
    ),
    Location(
      category: 'Monument',
      name: 'Sri Mariamman Temple',
      location: '244 South Bridge Road, Singapore',
      visitingHours: '07:00 - 12:00',
      closingTime: '12:00',
      description:
          'Oldest Hindu temple in Singapore, known for its stunning Dravidian architecture and intricate sculptures.',
      price: 0,
      reviews: ['Beautiful architecture!', 'Spiritual experience.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 1,
      image:
          'https://www.roots.gov.sg/-/media/Roots/Images/Stories/naraina-pillai/sri-mariamman-temple-01.ashx',
    ),
    Location(
      category: 'Monument',
      name: 'National Museum of Singapore',
      location: '93 Stamford Road, Singapore',
      visitingHours: '10:00 - 19:00',
      closingTime: '19:00',
      description:
          'Museum showcasing the history and culture of Singapore through interactive exhibits and artifacts.',
      price: 15,
      reviews: ['Educational and engaging!', 'Rich collection.'],
      preferredTime: 'Afternoon',
      priority: '2',
      duration: 1,
      image:
          'https://www.visitsingapore.com/content/dam/desktop/global/see-do-singapore/history/national-museum-of-singapore-carousel01-rect.jpeg',
    ),
    Location(
      category: 'Monument',
      name: 'Singapore Art Museum',
      location: '71 Bras Basah Road, Singapore',
      visitingHours: '10:00 - 19:00',
      closingTime: '19:00',
      description:
          'Contemporary art museum housed in a restored 19th-century school building.',
      price: 12,
      reviews: ['Art lover\'s paradise!', 'Diverse exhibitions.'],
      preferredTime: 'Afternoon',
      priority: '2',
      duration: 1,
      image:
          'https://www.thebestsingapore.com/wp-content/uploads/2015/07/Singapore-Art-Museum.jpg',
    ),
    Location(
      category: 'Monument',
      name: 'Esplanade - Theatres on the Bay',
      location: '1 Esplanade Drive, Singapore',
      duration: 2,
      visitingHours: '10:00 - 19:00',
      closingTime: '19:00',
      description:
          'Iconic performing arts center with theaters, concert halls, and waterfront views.',
      price: 0,
      reviews: ['Cultural hub!', 'Impressive architecture.'],
      preferredTime: 'Night',
      priority: '3',
      image:
          'https://www.esplanade.com/-/media/Esplanade/Images/Visit-Esplanade/Tours-and-Experiences/garden-tour-01.ashx?rev=be0385e20e7a40d585fc92c466b7209c&hash=EB8FB0E59B4E8D12B697FBB6C605A635',
    ),
    Location(
      category: 'Monument',
      name: 'Fort Siloso',
      location: 'Siloso Road, Sentosa, Singapore',
      visitingHours: '10:00 - 18:00',
      closingTime: '18:00',
      description:
          'Historical coastal fort with exhibits, tunnels, and panoramic views of the sea.',
      price: 12,
      reviews: ['Rich history!', 'Great for history buffs.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 1,
      image:
          'https://onecms-res.cloudinary.com/image/upload/s--av_yTgnt--/f_auto,q_auto/c_fill,g_auto,h_676,w_1200/v1/mediacorp/cna/image/2022/02/15/6-inch_breech_loading_bl_gun_emplacement_with_underground_magazine_image_courtesy_of_national_heritage_board.jpg?itok=kXcnDSoW',
    ),
    Location(
      category: 'Monument',
      name: 'Civilian War Memorial',
      location: 'Beach Road, Singapore',
      visitingHours: '00:00 - 24:00',
      closingTime: '23:59',
      description:
          'Memorial honoring civilians who perished during the Japanese occupation of Singapore.',
      price: 0,
      reviews: ['Solemn tribute!', 'Quiet reflection.'],
      preferredTime: 'Full Day',
      priority: '4',
      duration: 3,
      image:
          'https://images.unsplash.com/photo-1637421582554-ece8328a9bcc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l2aWxpYW4lMjB3YXIlMjBtZW1vcmlhbHxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Location(
      category: 'Special Attraction',
      name: 'Gardens by the Bay',
      location: '18 Marina Gardens Drive, Singapore',
      visitingHours: '09:00 - 21:00',
      closingTime: '21:00',
      description:
          'Futuristic park featuring the iconic Supertree Grove, Flower Dome, and Cloud Forest.',
      price: 0,
      reviews: ['Breathtaking views!', 'Must-see attractions.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 1,
      image:
          'https://www.visitsingapore.com/content/dam/desktop/global/see-do-singapore/nature-wildlife/gbtb/carousel1-940x940.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'Sentosa Island',
      location: 'Sentosa, Singapore',
      visitingHours: '09:00 - 21:00',
      closingTime: '21:00',
      description:
          'Popular resort island with attractions like Universal Studios, S.E.A. Aquarium, and Adventure Cove Waterpark.',
      price: 0,
      reviews: ['Fun-filled island!', 'Great for families.'],
      preferredTime: 'Full Day',
      priority: '4',
      duration: 3,
      image:
          'https://a.cdn-hotels.com/gdcs/production187/d438/72aa3862-1a1d-4005-a030-a331431c8b4f.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'Singapore Flyer',
      location: '30 Raffles Avenue, Singapore',
      visitingHours: '08:30 - 22:30',
      closingTime: '22:30',
      description:
          'Giant Ferris wheel offering panoramic views of the city skyline and beyond.',
      price: 33,
      reviews: ['Spectacular views!', 'Romantic experience.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 1,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Dikaiosp_210819_6963.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'ArtScience Museum',
      location: '6 Bayfront Avenue, Singapore',
      visitingHours: '10:00 - 19:00',
      closingTime: '19:00',
      description:
          'Futuristic museum with innovative exhibits blending art, science, and technology.',
      price: 21,
      reviews: ['Inspiring exhibits!', 'Family-friendly.'],
      preferredTime: 'Morning',
      priority: '2',
      duration: 2,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Dikaiosp_210819_6963.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'Haw Par Villa',
      location: '262 Pasir Panjang Road, Singapore',
      visitingHours: '09:00 - 18:00',
      closingTime: '18:00',
      description:
          'Theme park showcasing Chinese mythology through vibrant sculptures and dioramas.',
      price: 0,
      reviews: ['Unique experience!', 'Cultural exploration.'],
      preferredTime: 'Afternoon',
      priority: '2',
      duration: 1,
      image:
          'https://josiewanders.com/wp-content/uploads/2019/03/Haw-Par-Villa-.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'National Gallery Singapore',
      location: '1 St. Andrew\'s Road, Singapore',
      visitingHours: '10:00 - 19:00',
      closingTime: '19:00',
      description:
          'Art museum housed in two national monuments, showcasing Singaporean and Southeast Asian art.',
      price: 20,
      reviews: ['Artistic masterpiece!', 'Cultural immersion.'],
      preferredTime: 'Afternoon',
      priority: '2',
      duration: 1,
      image:
          'https://www.visitsingapore.com/see-do-singapore/arts/museums-galleries/national-gallery-singapore/jcr:content/par/column_control/ccpar1/content_img_insta/content/item1.thumbnail.image-path.560.315.jpg',
    ),
    Location(
      category: 'Special Attraction',
      name: 'Singapore Discovery Centre',
      location: '510 Upper Jurong Road, Singapore',
      visitingHours: '09:00 - 18:00',
      closingTime: '18:00',
      description:
          'Interactive museum with exhibits on Singapore\'s history, defense, and technological advancements.',
      price: 18,
      reviews: ['Educational and fun!', 'Great for families.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 1,
      image:
          'https://www.defencecollectivesg.com/wp-content/uploads/2022/05/Singapore-Discovery-Centre.jpg',
    ),

    // Parks
    Location(
      category: 'Park',
      name: 'Singapore Botanic Gardens',
      location: '1 Cluny Road, Singapore',
      visitingHours: '05:00 - 00:00',
      closingTime: '00:00',
      description:
          'Lush, expansive garden with themed sections, including the National Orchid Garden.',
      price: 0,
      reviews: ['Green oasis!', 'Perfect for nature lovers.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 1,
      image:
          'https://www.visitsingapore.com/content/dam/desktop/global/see-do-singapore/nature-wildlife/singapore-botanic-gardens-carousel01-rect.jpg',
    ),
    Location(
      category: 'Park',
      name: 'East Coast Park',
      location: 'East Coast Park Service Road, Singapore',
      visitingHours: '00:00 - 24:00',
      closingTime: '24:00',
      description:
          'Scenic coastal park with beaches, cycling paths, and recreational facilities.',
      price: 0,
      reviews: ['Beachside fun!', 'Great for outdoor activities.'],
      preferredTime: 'Full Day',
      priority: '4',
      duration: 1,
      image: 'https://media.timeout.com/images/105697504/image.jpg',
    ),
    Location(
      category: 'Park',
      name: 'Bishan-Ang Mo Kio Park',
      location: '1384 Ang Mo Kio Avenue 1, Singapore',
      visitingHours: '07:00 - 00:00',
      closingTime: '00:00',
      description:
          'Scenic park with water features, playgrounds, and a riverside promenade.',
      price: 0,
      reviews: ['Relaxing atmosphere!', 'Great for picnics.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 2,
      image:
          'https://images.squarespace-cdn.com/content/v1/5b008764710699f45ff1e509/1596177763433-JQBBJLVEGTY6V6Y7B4IS/IMG_2815.jpg',
    ),
    Location(
        category: 'Park',
        name: 'Labrador Nature Reserve',
        location: 'Labrador Villa Road, Singapore',
        visitingHours: '07:00 - 19:00',
        closingTime: '19:00',
        description:
            'Nature reserve with historical relics, coastal trails, and lush greenery.',
        price: 0,
        reviews: ['Serene nature walk!', 'Historical interest.'],
        preferredTime: 'Afternoon',
        priority: '2',
        duration: 3,
        image:
            'https://static.thehoneycombers.com/wp-content/uploads/sites/2/2022/10/Labrador-Nature-Reserve-900x643.jpg'),
    Location(
      category: 'Park',
      name: 'HortPark',
      location: '33 Hyderabad Road, Singapore',
      visitingHours: '06:00 - 22:00',
      closingTime: '22:00',
      description:
          'One-stop gardening hub with themed gardens, plant displays, and horticultural events.',
      price: 0,
      reviews: ['Botanical delight!', 'Perfect for plant enthusiasts.'],
      preferredTime: 'Morning',
      priority: '1',
      duration: 2,
      image:
          'https://www.nparks.gov.sg/-/media/gdo-2017/silvergarden_gallery1.ashx',
    ),
    Location(
      category: 'Park',
      name: 'West Coast Park',
      location: 'West Coast Highway, Singapore',
      visitingHours: '00:00 - 24:00',
      closingTime: '24:00',
      description:
          'Recreational park with playgrounds, cycling paths, and waterfront views along West Coast Beach.',
      price: 0,
      reviews: ['Family-friendly!', 'Relaxing atmosphere.'],
      preferredTime: 'Full Day',
      priority: '4',
      duration: 2,
      image:
          'https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/west-coast-park/n126.ashx',
    ),

    // Nightlife
    Location(
      category: 'Nightlife',
      name: 'Clarke Quay',
      location: 'River Valley Road, Singapore',
      visitingHours: '21:00 - 05:00',
      closingTime: '05:00',
      description:
          'Riverside quay with a vibrant nightlife scene, featuring bars, restaurants, and nightclubs.',
      price: 0,
      reviews: ['Lively atmosphere!', 'Great for partygoers.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 3,
      image:
          'https://www.introducingsingapore.com/f/singapur/singapur/guia/clarke-quay.jpg',
    ),
    Location(
      category: 'Nightlife',
      name: 'Zouk Singapore',
      location: '3C River Valley Road, Clarke Quay, Singapore',
      visitingHours: '22:00 - 04:00',
      closingTime: '04:00',
      description:
          'Renowned nightclub with multiple dance floors and a diverse range of music genres.',
      price: 30,
      reviews: ['Legendary club!', 'Fantastic DJ lineup.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 3,
      image:
          'https://enepl.com.sg/wp-content/uploads/2021/06/Zouk-Clarke-Quay-Singapore-1-1-e1623307717611.jpg',
    ),
    Location(
      category: 'Nightlife',
      name: 'Holland Village',
      location: 'Holland Avenue, Singapore',
      visitingHours: '22:00 - 04:00',
      closingTime: '04:00',
      description:
          'Bohemian neighborhood with a variety of bars, pubs, and live music venues.',
      price: 0,
      reviews: ['Lively nightlife!', 'Local charm.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 2,
      image:
          'https://mindchamps-prod-wp.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2018/08/16212834/holland-v-web-1.jpg',
    ),
    Location(
      category: 'Nightlife',
      name: '1-Altitude Gallery & Bar',
      location: '1 Raffles Place, Singapore',
      visitingHours: '15:00 - 22:00',
      closingTime: '22:00',
      description:
          'Tallest rooftop bar in Singapore with stunning views of the city skyline.',
      price: 35,
      reviews: ['Unbeatable views!', 'Chic ambiance.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 2,
      image:
          'https://www.1-altitude.com/wp-content/uploads/2021/06/1A-Rooftop_Sep2020-042311.jpg',
    ),
    Location(
      category: 'Nightlife',
      name: 'Marina Bay Sands Casino',
      location: '10 Bayfront Avenue, Singapore',
      visitingHours: '00:00 - 24:00',
      closingTime: '24:00',
      description:
          'World-class casino located at the iconic Marina Bay Sands complex.',
      price: 0,
      reviews: ['Exciting gaming!', 'Luxurious experience.'],
      preferredTime: 'Night',
      priority: '3',
      duration: 3,
      image:
          'https://www.visitsingapore.com/content/dam/desktop/global/see-do-singapore/recreation-leisure/marina-bay-sands-carousel01-rect.jpg',
    ),
  ];

  //list of items in selection "cart"
  List<Location> _selectedPlaces = [];

  //get list of locations available
  List<Location> getPlaces() {
    return _places;
  }

  List<Location> getSelectedPlaces() {
    return _selectedPlaces;
  }

  //add item to selection "cart"
  void addToSelectedPlaces(Location place, tooManyPlaces) {
    if (!tooManyPlaces) {
      _selectedPlaces.add(place);
      notifyListeners();
    }
  }

  //remove item from selection "cart"
  void removeFromSelectedPlaces(Location place, tooManyPlaces) {
    _selectedPlaces.remove(place);
    notifyListeners();
  }
}
