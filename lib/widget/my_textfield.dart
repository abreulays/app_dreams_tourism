import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget { //Um widget sem estado, o que significa que sua aparência não muda com o tempo.
  // ignore: prefer_typing_uninitialized_variables
  final controller; //Uma variável que representa o controlador de texto associado ao campo de entrada. A ausência de tipo indica que pode ser de qualquer tipo.
  final String hintText; //representa o texto de dica, quando o campo não foi preenchido corretamente ou não foi preenchido
  final bool obscureText; //booleano que indica que o campo de entrada deve ficar obscurecido (senhas)


  const MyTextField({//Construtor que aceita os parâmetros mencionados acima.
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
