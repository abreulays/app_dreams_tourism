
import 'package:app_dreams_tourism/model/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Destination> destinations = [
  Destination(
    imageUrl: 'lib/assets/images/fortaleza.jpn.png',
    city: 'Fortaleza',
    country: '  Brasil',
    description: 'Fortaleza  é a capital do estado do Ceará, no Nordeste brasileiro. É uma cidade conhecida por suas praias, palmeiras, dunas e lagoas.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/Floripa 2.jpn.png',
    city: 'Florianopolis',
    country: '  Brasil',
    description: 'Florianopolis é famosa pelas suas praias, incluindo estâncias turísticas populares como a Praia dos Ingleses na extremidade norte da ilha.',
    activities: activities,
  ),

  Destination(
    imageUrl: 'lib/assets/images/natal.jpn.png',
    city: 'Natal',
    country: 'Brasil',
    description: 'Conhecida pelas dunas de areia costeiras e pelo Forte dos Reis Magos, em forma de estrela, uma fortaleza portuguesa do século XVI na foz do rio Potengi.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/SP.jpn.png',
    city: 'São Paulo ',
    country: 'Brasil',
    description: 'São Paulo, considerado o maior centro financeiro do Brasil, está entre as cidades mais populosas do mundo, uma metrópole que oferece maravilhas.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/rio_de_janeiro2.jpn.png',
    city: 'Rio de Janeiro',
    country: 'Brasil',
    description: 'O Rio de Janeiro famosa pela estátua de 38 metros de altura do Cristo Redentor, no topo do Corcovado. Tem praias e pontos turisticos incríveis.',
    activities: activities,
  ),
];
