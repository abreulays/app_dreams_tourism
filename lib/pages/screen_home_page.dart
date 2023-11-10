import 'package:app_dreams_tourism/Model/user_model.dart';
import 'package:flutter/material.dart';

class ScreenHomePage extends StatelessWidget {
  final UserModel user;

  const ScreenHomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Olá, ${user.nome}!"),
      ),
    );
  }
}
