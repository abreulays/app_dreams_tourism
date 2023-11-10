import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/favoritos_page.dart';
import 'package:app_dreams_tourism/pages/pedidos_page.dart';
import 'package:app_dreams_tourism/pages/screen_home_page.dart';
import 'package:app_dreams_tourism/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

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
          children: [
            ScreenHomePage(user: widget.user),
            const FavoritosPage(),
            const PedidosPage(),
            ProfilePage(user: widget.user),
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
                icon: Icons.home_filled,
                text: 'Inicio',
              ),
              
              GButton(
                icon: Icons.favorite,
                text: 'Favoritos',
              ),
              GButton(
                icon: Icons.airplane_ticket_outlined,
                text: 'Pedidos',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
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
