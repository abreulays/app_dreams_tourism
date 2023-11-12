import 'package:flutter/material.dart';

const List<String> generos = ['Masculino', 'Feminino'];

class GenderDropdown extends StatefulWidget {
  final Function(String?) onSelect;

  const GenderDropdown({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? generoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: DropdownButtonFormField<String>(
        value: generoSelecionado,
        onChanged: (String? newValue) {
          setState(() {
            generoSelecionado = newValue;
            widget.onSelect(generoSelecionado); // Chamando a função de retorno de chamada
          });
        },
        items: generos.map<DropdownMenuItem<String>>((String genero) {
          return DropdownMenuItem<String>(
            value: genero == 'Masculino' ? 'M' : 'F',
            child: Text(genero),
          );
        }).toList(),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Selecione o Gênero',
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
