import 'package:flutter/material.dart';

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
  final String email;
  final String telefone;
  final String cpf;
  // final String dtNascimento;
  final String endereco;
  final String cidade;
  final String bairro;
  final String uf;

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cpf,
    // required this.dtNascimento,
    required this.endereco,
    required this.cidade,
    required this.bairro,
    required this.uf,

  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'cpf': cpf,
      // // 'dtNascimento': dtNascimento,
      'endereco': endereco,
      'cidade': cidade,
      'bairro': bairro,
      'uf': uf,

    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cpf: json['cpf'],
      // // dtNascimento: json['dtNascimento'],
      endereco: json['endereco'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      uf: json['uf'],
    );
  }
}
