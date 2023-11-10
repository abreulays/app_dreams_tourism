import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/notification_page.dart';
import 'package:app_dreams_tourism/widget/destination_carousel.dart';
import 'package:app_dreams_tourism/widget/hotel_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenHomePage extends StatefulWidget {
  final UserModel user;

  const ScreenHomePage({Key? key, required this.user}) : super(key: key);

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Color.fromRGBO(140, 82, 255, 1)
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Color.fromRGBO(255, 255, 255, 1)
              : Color.fromARGB(255, 196, 180, 195),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Adicionar o ícone de notificação
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.all(10.0), // Aumentar o tamanho do ícone

                        child: Icon(
                          Icons.notifications,
                          size: 30.0, // Aumentar o tamanho do ícone
                          color: Color.fromRGBO(140, 82, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                        width:
                            10.0), // Adiciona algum espaço entre o texto e o nome do usuário
                    Text(
                      'Bora se aventurar, \n${widget.user.nome.split(' ')[0]}?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map(
                      (MapEntry map) => _buildIcon(map.key),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.0),
              DestinationCarousel(),
              SizedBox(height: 20.0),
              HotelCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
