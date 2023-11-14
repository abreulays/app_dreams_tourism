import 'package:flutter/material.dart';

// Esse widget representa um azulejo quadrado que contém uma imagem. Vamos analisar cada parte do código:o
class SquareTile extends StatelessWidget { //onstrutor que aceita o caminho da imagem como parâmetro.
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) { //Implementação do método build, que constrói a interface do widget.
    return Container( //ntém o conteúdo do SquareTile.
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Image.asset( //Contém um widget Image.asset que exibe a imagem.
        imagePath, //O caminho da imagem, fornecido como parâmetro no construtor.
        height: 40,
      ),
    );
  }
}
