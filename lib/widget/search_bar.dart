import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey), // Cor do hint text
          suffixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(140, 82, 255, 1), // Cor do ícone de pesquisa
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
