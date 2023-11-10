import 'package:app_dreams_tourism/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_dreams_tourism/Model/user_model.dart';
import 'package:app_dreams_tourism/widget/category_card.dart';

class ScreenHomePage extends StatefulWidget {
  final UserModel user;

  const ScreenHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(140, 82, 255, 1), // Torna a AppBar transparente
        elevation: 0, // Remove a sombra da AppBar
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: Text(
          "Dream's Tourism",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(140, 82, 255, 1),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Olá, ${widget.user.nome.split(' ')[0]}!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 20),
                  const SearchBarField(),
                  const SizedBox(height: 20),
                  Text(
                    "Que tal uma nova aventura?",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          categoryTitle: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          categoryTitle: "Kegel Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          categoryTitle: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) {
                            //     ; // Replace with your actual screen
                            //   },
                            //   ),
                            // );
                          },
                        ),
                        CategoryCard(
                          categoryTitle: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
