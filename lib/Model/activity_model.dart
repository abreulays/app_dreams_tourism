
// define uma classe chamada Activity: Activity é uma classe: Em programação orientada a objetos, uma classe é uma estrutura que 
//define um conjunto de propriedades e métodos que serão compartilhados por todos os objetos criados a partir dessa classe.

class Activity {
  int id;
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;
  String city;
  bool favorite;


  Activity({ 
  //isso é um construtor, um  método especial que é chamado quando um novo objeto da classe é criado. Neste caso, estamos obrigando ele  
  //a requerer as propriedades sendo necessária que sejam fornecidas ao criar um novo objeto Activity.
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.startTimes,
    required this.rating,
    required this.price,
    required this.city,
    required this.favorite,
  });
}

// Cria instâncias de atividades turísticas e destinos. 

List<Activity> activities = [
  Activity(
    id: 1,
    imageUrl: 'lib/assets/images/fortaleza.jpn.png',
    name: 'Fortaleza/Dragão do Mar',
    type: 'Passeio',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
    city: 'Fortaleza',
    favorite: false,
  ),
  Activity(
    id: 2,
    imageUrl: 'lib/assets/images/natal.jpn.png',
    name: 'Natal/Praia  Genipabu ',
    type: 'Passeio',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
    city: 'Fortaleza',
    favorite: false,
  ),
  Activity(
    id: 3,
    imageUrl: 'lib/assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
    city: 'Fortaleza',
    favorite: false,
  ),
  
];