import 'package:app_dreams_tourism/pages/favoritos_page.dart';
import 'package:app_dreams_tourism/pages/pacotes_page.dart';
import 'package:app_dreams_tourism/pages/screen_home_page.dart';
import 'package:app_dreams_tourism/pages/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  int paginaAtual = 0;
  late PageController pc;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: setPaginaAtual,
          children: const [
            ScreenHomePage(),
            PacotesPage(),
            FavoritosPage(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(140, 82, 255, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          

          child: GNav(
            backgroundColor: const Color.fromRGBO(140, 82, 255, 1),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(186, 152, 255, 0.30),
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.airplane_ticket_outlined,
                text: 'Pacotes',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favoritos',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Configurações',
              ),
            ],
            selectedIndex: paginaAtual, // Defina o índice selecionado
            onTabChange: (index) {
              // Atualize o PageView para a página selecionada
              pc.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ),
    );
  }
}
