import 'package:flutter/material.dart';

//Uma lista de strings que representa os gêneros disponíveis para seleção no dropdown.
const List<String> generos = ['Masculino', 'Feminino'];

//Declaração da classe GenderDropdown, que estende StatefulWidget. Este widget possui estado mutável.
// Uma função de retorno de chamada que será chamada quando um novo gênero for selecionado.
// O parâmetro String? representa o valor selecionado (o gênero).
//  Construtor que exige a função onSelect como parâmetro.
class GenderDropdown extends StatefulWidget {
  final Function(String?) onSelect;

  const GenderDropdown({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? generoSelecionado; //armazena o genêro informado

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: DropdownButtonFormField<String>( 
//Retorna um widget DropdownButtonFormField que é um dropdown de seleção.
// um dropdown é um widget que permite ao usuário selecionar um valor de uma lista. O dropdown é composto por um botão que, 
//quando clicado, abre um menu suspenso com os valores disponíveis.
        value: generoSelecionado,
        onChanged: (String? newValue) {
          setState(() {
            generoSelecionado = newValue;
            widget.onSelect(generoSelecionado); // Chamando a função de retorno de chamada
          });
        },
        
        items: generos.map<DropdownMenuItem<String>>((String genero) {
          // Define a lista de itens no dropdown. Mapeia os gêneros para criar DropdownMenuItem para cada um.
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
