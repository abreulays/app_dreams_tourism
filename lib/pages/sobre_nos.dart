import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:flutter/material.dart';

class SobreNosPage extends StatelessWidget {
  final UserModel user;

  const SobreNosPage({Key? key, required this.user}) : super(key: key);

// Nesse trecho de código, a palavra-chave override está sendo usada para indicar que o método build na classe atual está
// sobrescrevendo o método build da classe pai.
//Widget build(BuildContext context) {: Este é o método build. Ele recebe um parâmetro obrigatório chamado context, que
// fornece informações sobre a localização do widget na árvore de widgets do Flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // retorna um widge (Scaffold) que fornece uma estrutura básica para a página inicial.
      appBar: AppBar(
        //uma propriedade que define uma barra de aplicativos (barra superior) da página.
        title: const Text(
          'SOBRE NÓS',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(140, 82, 255, 1), // Cor do título (roxo)
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation:
            0, // Remove a sombra da AppBar e elevação da barra de aplicativos para 0.
        centerTitle: true, // Centraliza o título na AppBar
        iconTheme: const IconThemeData(
            color: Colors.grey), // Altera a cor do ícone de voltar
      ),
      body: const SingleChildScrollView(
        //Esse widget é útil quando o conteúdo da tela é maior do que a tela visível,
        // permitindo que o usuário role para ver todo o conteúdo.
        padding: EdgeInsets.all(20.0),
        child: Column(
          //organiza os "filhos" verticalmente
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //para ocuparem toda a largura horizontal disponível.
          children: [
            //recebe uma lista de widgets
            Text(
              "Somos uma agência de turismo com o objetivo de proporcionar aos nossos clientes a melhor viagem da vida deles, com o melhor custo-benefício e segurança que eles merecem.\n\nA Dreams tourism é uma recém startup no mercado de turismo com grandes parcerias com os melhores hotéis e passeios exclusivos.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  //Este trecho de código define uma função chamada _getUserFields que cria e retorna uma lista de objetos UserField.
  //Cada UserField representa um campo específico associado a um usuário (UserModel).

  List<UserField> _getUserFields(UserModel user) {
    //List<UserField> _getUserFields(UserModel user) {: A função recebe um parâmetro user do tipo UserModel e retorna uma lista de objetos UserField.
    return [
      //A função utiliza a sintaxe de lista literal para criar e retornar uma lista de objetos UserField
      UserField(
          label: 'Nome',
          value: user
              .nome), //Ex: Para o campo 'Nome', o valor do atributo nome do objeto user é usado como valor associado ao campo.
      UserField(label: 'Email', value: user.email),
      UserField(label: 'Telefone', value: user.telefone),
      UserField(label: 'CPF', value: user.cpf),
      UserField(label: 'Gênero', value: user.sexo),
      // UserField(label: 'Nascimento', value: user.dtNascimento),
      UserField(label: 'Logradouro', value: user.logradouro),
      UserField(label: 'CEP', value: user.cep),
      UserField(label: 'Número', value: user.num_residencia),
      UserField(label: 'Complemento', value: user.complemento),
      UserField(label: 'Cidade', value: user.cidade),
      UserField(label: 'Bairro', value: user.bairro),
      UserField(label: 'UF', value: user.uf),
    ];
  }
}

class UserField {
  final String label;
  final String value;

//UserField({required this.label, required this.value});:
// Define um construtor para a classe. Esse construtor aceita dois parâmetros obrigatórios
// (label e value) e os atribui às variáveis de instância correspondentes. O uso de required
// indica que esses parâmetros devem ser fornecidos ao criar uma instância da classe.

  UserField({required this.label, required this.value});
}
