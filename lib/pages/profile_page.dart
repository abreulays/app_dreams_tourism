import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/update_dados_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_dreams_tourism/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  Future<void> _signUserOut(BuildContext context) async {
    // Remova o token de sessão ao sair
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_token');

    // Redirecione para a tela de login ou qualquer outra tela apropriada
    // Substitua a linha abaixo pela navegação para a tela de login
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'PERFIL',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(140, 82, 255, 1), // Cor do título (roxo)
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove a sombra da AppBar
        actions: [
          IconButton(
            onPressed: () {
              _signUserOut(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.red, // Cor do ícone (vermelho)
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Área da Foto de Perfil
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey, // Cor de fundo do círculo
              child: Icon(
                Icons.person, // Ícone de pessoa
                size: 60,
                color: Colors.white, // Cor do ícone
              ),
            ),

            const SizedBox(height: 20), // Espaçamento entre a foto e o nome

            // Nome do Usuário
            Center(
              child: Text(
                user.nome,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20), // Espaçamento entre o nome e os botões

            // Três Botões Estilizados
            ElevatedButton(
              onPressed: () {
                // Ação do primeiro botão para abrir a página UpdateDadosUser()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateDadosUser(user: user,)),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(140, 82, 255, 1), backgroundColor: Colors.grey.shade200, // Cor do texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color.fromARGB(255, 224, 224, 224)), // Cor da borda
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text('Meus Dados', style: TextStyle(fontSize: 16),),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Ação do primeiro botão para abrir a página UpdateDadosUser()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateDadosUser(user: user,)),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(140, 82, 255, 1), backgroundColor: Colors.grey.shade200, // Cor do texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color.fromARGB(255, 224, 224, 224)), // Cor da borda
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text('Segurança', style: TextStyle(fontSize: 16),),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Ação do primeiro botão para abrir a página UpdateDadosUser()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateDadosUser(user: user,)),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(140, 82, 255, 1), backgroundColor: Colors.grey.shade200, // Cor do texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Color.fromARGB(255, 224, 224, 224)), // Cor da borda
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text('Termos de Uso', style: TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}
