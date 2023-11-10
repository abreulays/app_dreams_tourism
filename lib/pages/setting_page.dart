import 'package:app_dreams_tourism/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_dreams_tourism/pages/login_page.dart';

class SettingPage extends StatelessWidget {
  final UserModel user;

  const SettingPage({Key? key, required this.user}) : super(key: key);

  Future<void> _signUserOut(BuildContext context) async {
    // Remova o token de sessão ao sair
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_token');

    // Redirecione para a tela de login ou qualquer outra tela apropriada
    // Substitua a linha abaixo pela navegação para a tela de login
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'SEUS DADOS',
            style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var field in _getUserFields(user)) ...[
              ListTile(
                title: Text(field.label),
                subtitle: Text(field.value),
              ),
            ],
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  List<UserField> _getUserFields(UserModel user) {
    return [
      UserField(label: 'Nome', value: user.nome),
      UserField(label: 'Email', value: user.email),
      UserField(label: 'Telefone', value: user.telefone),
      UserField(label: 'CPF', value: user.cpf),
      // UserField(label: 'Nascimento', value: user.dtNascimento),
      UserField(label: 'Endereço', value: user.endereco),
      UserField(label: 'Cidade', value: user.cidade),
      UserField(label: 'Bairro', value: user.bairro),
      UserField(label: 'UF', value: user.uf),
      // Adicione mais campos conforme necessário
    ];
  }
}

class UserField {
  final String label;
  final String value;

  UserField({required this.label, required this.value});
}
