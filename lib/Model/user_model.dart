import 'package:flutter/material.dart';


//Classe UserModel repesenta um modelo de dados dos usuários, cada instancia contém uma informação do usuário.
//toJson (Json, ele é usado pra trocar os dados entre o servidor e o cliente) converte um objeto da classe para um Map<String> 
//fromJson instância a classe UserModel a partir de um mapa JSON (criado pelo próprio sistema)

//UserModelProvider (dependendo do que recebe ele altera a classe. Exemplo: Entrei com Lays, ele muda tudo pra Lays.)

class UserModelProvider extends ChangeNotifier {
  UserModel? user;

  void setUser(UserModel userModel) {
    user = userModel;
    notifyListeners();
  }
}

class UserModel {
  final String id;
  final String nome;
  final String sexo;
  final String email;
  final String telefone;
  final String cpf;
  // final String dtNascimento;
  final String cep;
  final String logradouro;
  // ignore: non_constant_identifier_names
  final String num_residencia;
  final String complemento;
  final String cidade;
  final String bairro;
  final String uf;

  UserModel({
    required this.id,
    required this.nome,
    required this.sexo,
    required this.email,
    required this.telefone,
    required this.cpf,
    // required this.dtNascimento,
    required this.cep,
    required this.logradouro,
    // ignore: non_constant_identifier_names
    required this.num_residencia,
    required this.complemento,
    required this.cidade,
    required this.bairro,
    required this.uf,

  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'sexo': sexo,
      'email': email,
      'telefone': telefone,
      'cpf': cpf,
      // // 'dtNascimento': dtNascimento,
      'cep': cep,
      'logradouro': logradouro,
      'num_residencia': num_residencia,
      'complemento': complemento,
      'cidade': cidade,
      'bairro': bairro,
      'uf': uf,

    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nome: json['nome'],
      sexo: json['sexo'],
      email: json['email'],
      telefone: json['telefone'],
      cpf: json['cpf'],
      // dtNascimento: json['dtNascimento'],
      cep: json['cep'],
      logradouro: json['logradouro'],
      num_residencia: json['num_residencia'],
      complemento: json['complemento'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      uf: json['uf'],
    );
  }
}
