import 'package:app_dreams_tourism/widget/list_card_favorites.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título com ícone
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber, // Cor amarela
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Meus Favoritos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Lista de favoritos
              ListCardFavorite(),
            ],
          ),
        ),
      ),
    );
  }
}
