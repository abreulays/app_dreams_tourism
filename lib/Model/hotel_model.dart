class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'lib/assets/images/fortaleza.jpn.png',
    name: 'Mais sobre Fortaleza',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'lib/assets/images/Floripa 2.jpn.png',
    name: 'Mais sobre Florianopolis',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'lib/assets/images/rio_de_janeiro2.jpn.png',
    name: 'Mais sobre Rio de Janeiro',
    address: '404 Great St',
    price: 240,
  ),
];