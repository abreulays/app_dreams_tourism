import 'dart:convert';
import 'package:app_dreams_tourism/widget/date_input_field.dart';
import 'package:app_dreams_tourism/widget/global_variavel.dart';
import 'package:app_dreams_tourism/widget/my_button.dart';
import 'package:app_dreams_tourism/widget/my_textfield.dart';
import 'package:app_dreams_tourism/pages/login_page.dart';
import 'package:app_dreams_tourism/widget/sexo_dropwdown_input.dart';
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
  // Váriaveis de controle do que é inserido no input
  final nameController = TextEditingController();
  final telefoneController = TextEditingController();
  final cpfController = TextEditingController();
  final sexoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nascimentoController = TextEditingController();
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numRediedenciaController = TextEditingController();
  final complementoController = TextEditingController();
  final cidadeController = TextEditingController();
  final bairroController = TextEditingController();
  final ufController = TextEditingController();

  // Api ViaCEP
  // Faz uma requisição através da URL, passando o CEP digitado, e retornando um
  //json com as informações soicitadas, e preenche os campos automaticamente.
  Future<void> apiViaCep(String cep) async {
    final viaCEPUrl = Uri.parse('https://viacep.com.br/ws/$cep/json/');

    try {
      final response = await http.get(viaCEPUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          // Preencher os campos com os dados retornados pela API
          logradouroController.text = data['logradouro'];
          cidadeController.text = data['localidade'];
          bairroController.text = data['bairro'];
          ufController.text = data['uf'];
        });
      } else {
        // Tratar erro, se necessário
        debugPrint('Erro ao obter dados do CEP: ${response.statusCode}');
      }
    } catch (e) {
      // Tratar exceção, se necessário
      debugPrint('Erro na requisição: $e');
    }
  }

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

  void registerUser() async {
    // Exibe um carregando
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    var url = Uri.parse("${GlobalVariables.ipAddress}/api_dreams_tourism/singup.php");
    var data = {
      "nome": nameController.text,
      "telefone": telefoneController.text,
      "cpf": cpfController.text.toString(),
      "sexo": sexoController.text,
      "email": emailController.text,
      "senha": passwordController.text,
      "data_nascimento": nascimentoController.text,
      "cep": cepController.text,
      "logradouro": logradouroController.text,
      "num_residencia": numRediedenciaController.text,
      "complemento": complementoController.text,
      "cidade": cidadeController.text,
      "bairro": bairroController.text,
      "uf": ufController.text,
    };
    try {
      final response = await http.post(url, body: data);

      // Oculta o carregando
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody == "user exist") {
          showBoxMessage("Conta já cadastrada!");
        } else if (responseBody == "true") {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Conta cadastrada com sucesso!"),
              duration: Duration(seconds: 2),
            ),
          );

          // Adiciona um pequeno atraso antes de navegar para a página de login
          await Future.delayed(const Duration(seconds: 2));

          // Redirecione para a página de login
          // ignore: use_build_context_synchronously
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
                    keyboardType: TextInputType.phone,
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
                    keyboardType: TextInputType.phone,
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

                GenderDropdown(
                  onSelect: (value) {
                    setState(() {
                      sexoController.text = value!;
                    });
                  },
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
                // cep textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: cepController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "CEP",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          8), // Limita a 11 caracteres (DDD + 9 dígitos)
                    ],
                    onChanged: apiViaCep,
                  ),
                ),
                const SizedBox(height: 10),
                // numero residencia textfield
                MyTextField(
                  controller: numRediedenciaController,
                  hintText: 'Número',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // complemento textfield
                MyTextField(
                  controller: complementoController,
                  hintText: 'Complemento',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
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
