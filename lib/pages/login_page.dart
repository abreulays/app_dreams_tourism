import 'dart:convert';

import 'package:app_dreams_tourism/components/my_button.dart';
import 'package:app_dreams_tourism/components/my_textfield.dart';
import 'package:app_dreams_tourism/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  void loginUser() async {
    var url = Uri.parse("http://192.168.1.193/api_dreams_tourism/singin.php");
    var data = {
      "email": emailController.text,
      "pass": passwordController.text,
    };
    try {
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody == "Account already exists") {
          showBoxMessage("Conta já cadastrada!");
        } else if (responseBody == "true") {
          showBoxMessage("Login realizado com sucesso!");
          emailController.text = "";
          passwordController.text = "";
        } else {
          showBoxMessage("Erro ao logar");
        }
      } else {
        showBoxMessage("Erro na solicitação: ${response.statusCode}");
      }
    } catch (e) {
      showBoxMessage("Erro na resposta do servidor: $e");
      print(e);
    }
  }

  // Function to validate login
  Future<void> validateLogin() async {
    // Get the entered email and password
    // final email = emailController.text;
    // final password = passwordController.text;

    // Close the loading dialog
    Navigator.pop(context);
  }

  // Sign user in method
  Future<void> signUserIn() async {
    // Show a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Validate the login
    validateLogin();
  }

  void showErrorMessage(String message) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                SizedBox(
                  child: Image.asset(
                    "lib/images/logo.png",
                    height: 150,
                  ),
                ),

                const SizedBox(height: 20),

                // Welcome back, you've been missed!
                Text(
                  'Entre e conheça o mundo!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // Username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Sign in button
                MyButton(
                  text: "Entrar",
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não possui cadastro?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Navegar para a página RegisterPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Registre-se!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
