import 'dart:convert';
import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/widget/my_button.dart';
import 'package:app_dreams_tourism/widget/my_textfield.dart';
import 'package:app_dreams_tourism/pages/home_page.dart';
import 'package:app_dreams_tourism/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> signUserIn() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final url =
          Uri.parse("http://192.168.1.90/api_dreams_tourism/signin.php");
      final data = {
        "email": emailController.text,
        "pass": passwordController.text,
      };

      showLoadingDialog();

      final response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody == "user invalid") {
          showErrorMessage("Usuário ou senha incorreta!");
        } else if (responseBody is Map<String, dynamic>) {
          // Autenticação bem-sucedida, o responseBody contém as informações do usuário
          final user = UserModel.fromJson(responseBody);

          final userModelProvider =
              Provider.of<UserModelProvider>(context, listen: false);
          userModelProvider.setUser(user);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user', jsonEncode(user));

          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(user: user),
            ),
          );
        } else {
          showErrorMessage("Erro ao logar");
        }
      } else {
        showErrorMessage("Erro na solicitação: ${response.statusCode}");
        debugPrint("Erro na solicitação: ${response.statusCode}");
      }
    } catch (e) {
      showErrorMessage("Erro na resposta do servidor: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
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
                    "lib/assets/images/logo.png",
                    height: 150,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Dreams Tourism',
                  style: TextStyle(
                      color: Color.fromRGBO(140, 82, 255, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),

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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Esqueceu sua senha?',
                //         style: TextStyle(color: Colors.grey[600]),
                //       ),
                //     ],
                //   ),
                // ),

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
                            builder: (context) => const RegisterPage(),
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
