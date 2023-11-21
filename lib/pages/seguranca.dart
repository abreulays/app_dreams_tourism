import 'dart:convert';
import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/widget/global_variavel.dart';
import 'package:app_dreams_tourism/widget/my_button.dart';
import 'package:app_dreams_tourism/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SegurancaPage extends StatefulWidget {
  final UserModel user;

  const SegurancaPage({Key? key, required this.user}) : super(key: key);

  @override
  State<SegurancaPage> createState() => _SegurancaPageState();
}

class _SegurancaPageState extends State<SegurancaPage> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  void showBoxMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void updatePassword() async {
    // Verifica se as senhas coincidem
    if (newPasswordController.text != confirmNewPasswordController.text) {
      showBoxMessage("As senhas não coincidem.");
      return;
    }

    // Exibe um carregando
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    var url = Uri.parse(
        "${GlobalVariables.ipAddress}/api_dreams_tourism/update_password.php");
    var data = {
      "id": widget.user.id,
      "senha_atual": currentPasswordController.text,
      "nova_senha": newPasswordController.text,
    };

    try {
      final response = await http.post(url, body: data);

      // Oculta o carregando
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody == "current-pass-invalid") {
          showBoxMessage("Senha atual incorreta.");
        } else if (responseBody == "true") {
          // Limpa os campos de texto
          currentPasswordController.clear();
          newPasswordController.clear();
          confirmNewPasswordController.clear();

          // Exibe a mensagem de sucesso
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Senha atualizada com sucesso!"),
              duration: Duration(seconds: 2),
            ),
          );

          // Adiciona um pequeno atraso antes de navegar para outra página, se necessário
          await Future.delayed(const Duration(seconds: 2));
        } else {
          showBoxMessage("Erro ao tentar atualizar a senha.");
        }
      } else {
        showBoxMessage("Erro na solicitação: ${response.statusCode}");
      }
    } catch (e) {
      showBoxMessage("Erro na resposta do servidor: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SEGURANÇA',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(140, 82, 255, 1),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            MyTextField(
              controller: currentPasswordController,
              hintText: 'Senha Atual',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: newPasswordController,
              hintText: 'Nova Senha',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: confirmNewPasswordController,
              hintText: 'Confirmar Nova Senha',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyButton(
              text: "Atualizar Senha",
              onTap: updatePassword,
            ),
          ],
        ),
      ),
    );
  }
}
