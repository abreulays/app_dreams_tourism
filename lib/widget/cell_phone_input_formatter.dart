import 'package:flutter/services.dart'; //interação com serviços do sistema 

class CellPhoneInputFormatter extends TextInputFormatter { // textInputFormat é uma classe base para formatação de texto em campos de entrada.
  @override

   //Implementação do método formatEditUpdate, que é chamado quando ocorre uma atualização no texto do campo de entrada.
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) { 
    final text = newValue.text; //Cria uma variável text para armazenar o texto atualizado do campo de texto.


 //Se o comprimento do texto for 1, verifica se o texto é diferente de "1". Se for diferente, 
 //substitui o texto por "1" e move o cursor para a posição 1.
    if (text.length == 1) {
      if (text != "1") {
        return const TextEditingValue(
          text: "1",
          selection: TextSelection.collapsed(offset: 1),
        );
      }

       //Se o comprimento do texto for 2, adiciona um parêntese aberto "(" ao texto e ajusta a posição do cursor.
    } else if (text.length == 2) {
      final newText = "($text";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );


//Se o comprimento do texto for 3, adiciona um parêntese fechado ")" ao texto e ajusta a posição do cursor
    } else if (text.length == 3) {
      final newText = "($text)";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );


       //Se o comprimento do texto atingir 14 caracteres (incluindo parênteses e traço), mantém o valor antigo (não faz alterações).
    } else if (text.length == 14) {
      // Limita em 14 caracteres (incluindo os parênteses e o traço)
      return oldValue;

 //Se o comprimento do texto for 9, adiciona um traço "-" ao texto e ajusta a posição do cursor.
    } else if (text.length == 9) {
      final newText = "$text-";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue; // Retorna o novo valor do campo de texto após a formatação.
  }
}
