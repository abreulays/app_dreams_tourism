import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//Declaração da classe CellPhoneInputFormatter que estende TextInputFormatter. 
//TextInputFormatter é uma classe base para formatação de texto em campos de entrada.
class DateInputField extends StatefulWidget {
  final TextEditingController controller; //final é usada para declarar variáveis que não podem ser alteradas após inicialização
  final String hintText;
  final bool obscureText;

  const DateInputField({super.key,  //função que recebe como argumentos controller,hint e obscure text.
    required this.controller, // O controlador de campo de texto que foi especificado como argumento para a função  
    required this.hintText, //O texto que foi especificado como argumento para a função 
    this.obscureText = false, //O valor booleano que foi especificado como argumento para a função 
  });

//é responsável por criar uma instância do estado da classe widget. A declaração de override indica ao compilador que o método 
//createState() está substituindo um método com o mesmo nome na superclasse da classe widget.
//Neste caso, a classe widget DateInputField está substituindo o método createState() da superclasse StatefulWidget.
  @override
  // ignore: library_private_types_in_public_api
  _DateInputFieldState createState() => _DateInputFieldState();
}

//Esta linha de código declara uma classe de estado chamada _DateInputFieldState para o widget DateInputField.
class _DateInputFieldState extends State<DateInputField> {
  // Esta linha de código declara uma constante chamada _dateFormat
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy'); 
//final declara variáveis que quando inicializada não podem ser modificadas.


  Future<void> _selectDate(BuildContext context) async {
//Esta linha de código declara um método assíncrono chamado _selectDate()
// que retorna um Future<void>. O método _selectDate() é chamado quando o usuário clica no campo de data.
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
//verifica se o usuário selecionou a data 
    if (picked != null && picked != DateTime.now()) {
      String formattedDate = _dateFormat.format(picked);
      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) { //constrói a interface do widget.
    return Padding( //: Retorna um widget Padding que contém um TextField e um botão de calendário.
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField( //Um campo de entrada de texto que exibe a data selecionada e tem um ícone de calendário à direita.
        controller: widget.controller, //Usa o controlador de texto fornecido para gerenciar o texto do campo.
        obscureText: widget.obscureText, //Define se o texto é obscurecido (não é relevante para campos de data).
        readOnly: true, // Torna o campo de entrada somente leitura
        decoration: InputDecoration( // Define a aparência do campo de entrada.
          enabledBorder: const OutlineInputBorder( //Define um campo de entrada de texto como filho do widget Padding.
            borderSide: BorderSide(color: Colors.white), //Define a cor da borda quando o campo não está focado para branco.
          ),
          focusedBorder: OutlineInputBorder(  //: Borda quando o campo de entrada está focado.
            borderSide: BorderSide(color: Colors.grey.shade400), //Define a cor da borda quando o campo está focado para cinza.
          ),
          fillColor: Colors.grey.shade200, // Cor do preenchimento do campo.
          filled: true, //Indica que o campo deve ser preenchido com a cor especificada.
          hintText: widget.hintText, //Texto de dica exibido quando o campo está vazio.
          hintStyle: TextStyle(color: Colors.grey[500]), //Estilo do texto de dica, definindo a cor para cinza.
          suffixIcon: IconButton( //Um ícone de calendário que, quando pressionado, chama o método _selectDate
            icon: const Icon(Icons.calendar_today), //: Ícone de calendário.
            onPressed: () {
              _selectDate(context); //Quando pressionado, chama o método _selectDate para abrir o seletor de data.
            },
          ),
        ),
      ),
    );
  }
}
