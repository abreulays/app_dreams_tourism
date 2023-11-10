import 'package:flutter/services.dart';

class CellPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length == 1) {
      if (text != "1") {
        return const TextEditingValue(
          text: "1",
          selection: TextSelection.collapsed(offset: 1),
        );
      }
    } else if (text.length == 2) {
      final newText = "($text";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    } else if (text.length == 3) {
      final newText = "($text)";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    } else if (text.length == 14) {
      // Limita em 14 caracteres (incluindo os parênteses e o traço)
      return oldValue;
    } else if (text.length == 9) {
      final newText = "$text-";
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}
