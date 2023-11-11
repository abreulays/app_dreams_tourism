import 'dart:convert';
import 'package:app_dreams_tourism/widget/date_input_field.dart';
import 'package:app_dreams_tourism/widget/input_uf_brasil.dart';
import 'package:app_dreams_tourism/widget/my_button.dart';
import 'package:app_dreams_tourism/widget/my_textfield.dart';
import 'package:app_dreams_tourism/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final nameController = TextEditingController();
  final telefoneController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nascimentoController = TextEditingController();
  final enderecoController = TextEditingController();
  final cidadeController = TextEditingController();
  final bairroController = TextEditingController();
  final ufController = TextEditingController();

  // Estado selecionado (inicialmente vazio)
  // String selectedState = '';

  // bool processing = false;

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

  // void onStateSelected(String? newState) {
  //   setState(() {
  //     selectedState = newState ??
  //         ""; // Use o operador ?? para fornecer um valor padrão, se necessário
  //   });
  // }

  void registerUser() async {
    var url = Uri.parse("http://172.20.10.2/api_dreams_tourism/singup.php");
    var data = {
      "nome": nameController.text,
      "telefone": telefoneController.text,
      "cpf": cpfController.text.toString(),
      "email": emailController.text,
      "pass": passwordController.text,
      "dt_nascimento": nascimentoController.text,
      "endereco": enderecoController.text,
      "cidade": cidadeController.text,
      "bairro": bairroController.text,
      "uf": ufController.text,
    };
    try {
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody == "user exist") {
          showBoxMessage("Conta já cadastrada!");
        } else if (responseBody == "true") {
          showBoxMessage("Conta cadastrada com sucesso!");
          nameController.text = "";
          telefoneController.text = "";
          cpfController.text = "";
          emailController.text = "";
          passwordController.text = "";
          confirmPasswordController.text = "";
          nascimentoController.text = "";
          enderecoController.text = "";
          cidadeController.text = "";
          bairroController.text = "";
          ufController.text = "";
          // Redirecione para a página de login
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          showBoxMessage("Erro ao tentar cadastrar");
        }
      } else {
        showBoxMessage("Erro na solicitação: ${response.statusCode}");
      }
    } catch (e) {
      showBoxMessage("Erro na resposta do servidor: $e");
    }
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
          )),
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
                const SizedBox(height: 20),

                const Text(
                  'REGISTRE-SE',
                  style: TextStyle(
                      color: Color.fromRGBO(140, 82, 255, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                // E conheça o mundo!
                Text(
                  'E conheça o mundo!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                // name textfield
                MyTextField(
                  controller: nameController,
                  hintText: 'Nome',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // telefone textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: telefoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Celular",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          11), // Limita a 11 caracteres (DDD + 9 dígitos)
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                // cpf textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: cpfController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "CPF",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                      
                      
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          11), // Limita a 11 caracteres (DDD + 9 dígitos)
                    ],
                    
                  ),
                ),

                const SizedBox(height: 10),
                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirmar Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                // data de nascimento textfield
                DateInputField(
                  controller: nascimentoController,
                  hintText: 'Data de Nascimento',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // endereco textfield
                MyTextField(
                  controller: enderecoController,
                  hintText: 'Endereço',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // cidade textfield
                MyTextField(
                  controller: cidadeController,
                  hintText: 'Cidade',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // bairro textfield
                MyTextField(
                  controller: bairroController,
                  hintText: 'Bairro',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // uf textfield
                // MyTextField(
                //   controller: ufController,
                //   hintText: 'UF',
                //   obscureText: false,
                // ),
                StateUfTextFild(
                  controller: ufController,
                  hintText: 'UF',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Registrar",
                  onTap: registerUser,
                ),

                const SizedBox(height: 30),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui cadastro?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Entrar!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
