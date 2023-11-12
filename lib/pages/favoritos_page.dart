//Define uma classe FavoritosPage que herda de StatelessWidget e representa uma página
//na qual o conteúdo principal é um texto "Favoritos!". 

//Extensão de StatelessWidget: FavoritosPage é uma classe que estende StatelessWidget, indicando que ela não tem estado mutável interno. 
//Isso significa que todos os elementos da UI nesta página são estáticos e não mudam ao longo do tempo.
// Este é um construtor constante que não aceita argumentos opcionais, exceto a chave (key) herdada de StatelessWidget.

// const indica que uma instância de FavoritosPage é imutável e, portanto, pode ser usado em contexto constante.

// O método build é obrigatório em qualquer classe que estende StatelessWidget ou StatefulWidget. 
//Ele é chamado pelo framework Flutter para construir a interface do usuário representada pela instância desta classe.
// O método retorna um widget Scaffold, que é um contêiner de nível superior para a estrutura básica de uma tela em Flutter.
// O Scaffold geralmente contém elementos como AppBar, Drawer, BottomNavigationBar e o conteúdo principal da tela.
// O corpo (body) do Scaffold é um widget Center que contém um único Text widget exibindo a mensagem "Favoritos!".

import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Favoritos!")),
    );
  }
}
