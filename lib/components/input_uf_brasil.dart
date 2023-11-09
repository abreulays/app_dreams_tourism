import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importe o pacote services.dart

class StateUfTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const StateUfTextFild({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        inputFormatters: [LengthLimitingTextInputFormatter(2)], // Limite de 2 caracteres
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
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
