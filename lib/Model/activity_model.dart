import 'dart:convert';
import 'package:http/http.dart' as http;

// define uma classe chamada Activity: Activity é uma classe: Em programação orientada a objetos, uma classe é uma estrutura que 
//define um conjunto de propriedades e métodos que serão compartilhados por todos os objetos criados a partir dessa classe.

class Activity {
  String id;
  String nomePacote;
  String preco;
  String duracaoInicio;
  String duracaoFinal;
  String statusPacote;
  String descricaoLugar;
  bool favoritos;
  String descricaoCard;
  String tituloCard;
  String cidade;
  String estado;
  String tipo;
  String avaliacao;
  
  Activity({ 
    required this.id,
    required this.nomePacote,
    required this.preco,
    required this.duracaoInicio,
    required this.duracaoFinal,
    required this.statusPacote,
    required this.descricaoLugar,
    required this.favoritos,
    required this.descricaoCard,
    required this.tituloCard,
    required this.cidade,
    required this.estado,
    required this.tipo,
    required this.avaliacao,
  });
}

Future<List<Activity>> fetchActivities() async {
  final url = Uri.parse("http://192.168.15.64/api_dreams_tourism/packages.php");
  final response = await http.post(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    List<Activity> activities = data.map((item) {
      return Activity(
        id: item['id'].toString(),
        nomePacote: item['nome_pacote'],
        preco: item['preco'],
        duracaoInicio: item['duracao_inicio'],
        duracaoFinal: item['duracao_final'],
        statusPacote: item['status_pacote'],
        descricaoLugar: item['descricao_lugar'],
        favoritos: item['favoritos'], // Alterado para bool
        descricaoCard: item['descricao_card'],
        tituloCard: item['titulo_card'],
        cidade: item['cidade'],
        estado: item['estado'],
        tipo: item['tipo'],
        avaliacao: item['avaliacao'],
      );
    }).toList();

    return activities;
  } else {
    throw Exception('Falha na solicitação');
  }
}
// Cria instâncias de atividades turísticas e destinos. 

// List<Activity> activities = [
//   Activity(
//     id: '1',
//     imageUrl: 'lib/assets/images/fortaleza.jpn.png',
//     name: 'Dragão do Mar',
//     type: 'Passeio',
//     description: 'Considerada a melhor praia da Orla urbana de Maceió e localizada no bairro de mesmo nome, a Praia de Ponta Verde tem o mesmo visual das praias vizinhas: coqueiros, trilhas de areia macia e um mar azul esverdeado. O lugar também forma piscinas naturais quando a maré está baixa.',
//     startTimes: ['9:00 am', '11:00 am'],
//     rating: 5,
//     price: 30,
//     city: 'Fortaleza',
//     favorite: false,
//   ),
//   Activity(
//     id: '2',
//     imageUrl: 'lib/assets/images/natal.jpn.png',
//     name: 'Praia Genipabu ',
//     type: 'Passeio',
//     description: 'Considerada a melhor praia da Orla urbana de Maceió e localizada no bairro de mesmo nome, a Praia de Ponta Verde tem o mesmo visual das praias vizinhas: coqueiros, trilhas de areia macia e um mar azul esverdeado. O lugar também forma piscinas naturais quando a maré está baixa.',
//     startTimes: ['11:00 pm', '1:00 pm'],
//     rating: 4,
//     price: 210,
//     city: 'Natal',
//     favorite: true,
//   ),
//   Activity(
//     id: '3',
//     imageUrl: 'lib/assets/images/murano.jpg',
//     name: 'Praia de Ponta Verde',
//     type: 'Passeio',
//     description: 'Considerada a melhor praia da Orla urbana de Maceió e localizada no bairro de mesmo nome, a Praia de Ponta Verde tem o mesmo visual das praias vizinhas: coqueiros, trilhas de areia macia e um mar azul esverdeado. O lugar também forma piscinas naturais quando a maré está baixa.',
//     startTimes: ['12:30 pm', '2:00 pm'],
//     rating: 3,
//     price: 125,
//     city: 'Maceió',
//     favorite: false,
//   ),
  
// ];

