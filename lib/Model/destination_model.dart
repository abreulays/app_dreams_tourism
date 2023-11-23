import 'package:app_dreams_tourism/model/activity_model.dart';

class Destination {
  String imageUrl;
  // String city;
  String region;
  String country;
  String description;
  List<Activity> activities;
  


  Destination({
    required this.imageUrl,
    // required this.city,
    required this.region,
    required this.country,
    required this.description,
    required this.activities, 
  });

  factory Destination.fromMap(Map<String, dynamic> map, List<Activity> activities) {
    return Destination(
      imageUrl: map['imageUrl'],
      // city: map['city'],
      region: map['region'],
      country: map['country'],
      description: map['description'],
      activities: activities,
    );
  }
}

List<Destination> getDestinations(List<Activity> activities) {
  return [
    Destination.fromMap(
      {
        'imageUrl': 'lib/assets/images/Imagem-destaque-ilha.png',
        'region': 'Nordeste',
        'country': 'Brasil',
        'description':
            'Região conhecida pelas tradições culturais e pelo tesouro cultural do país.   ',
      },
      activities,
    ),
    Destination.fromMap(
      {
        'imageUrl': 'lib/assets/images/SP.jpn.png',
        'region': 'Sudeste',
        'country': 'Brasil',
        'description':
            'O Sudeste é uma região dinâmica e multifacetada, marcada por centros urbanos pulsantes.',
      },
      activities,
    ),
    Destination.fromMap(
      {
        'imageUrl': 'lib/assets/images/imagem_sul.png',
        'region': 'Sul',
        'country': 'Brasil',
        'description':
            'O Sul do Brasil é uma região que se destaca pela rica diversidade e pelas tradições únicas.',
      },
      activities,
    ),
    Destination.fromMap(
      {
        'imageUrl': 'lib/assets/images/imagem_norte.png',
        'region': 'Norte',
        'country': 'Brasil',
        'description':
            'A região Norte é marcada pela vastidão geográfica, biodiversidade e riqueza cultural.',
      },
      activities,
    ),
    Destination.fromMap(
      {
        'imageUrl': 'lib/assets/images/imagem_centrooeste.png',
        'region': 'Centro-Oeste',
        'country': 'Brasil',
        'description':
            'A região Centro-Oeste é vasta e diversificada, crucial para o desenvolvimento agropecuário no Brasil. Onde fica nossa Capital.',
      },
      activities,
    ),
  ];
}


// List<Activity> activities = fetchActivities();
// List<Destination> destinations = getDestinations(activities);
