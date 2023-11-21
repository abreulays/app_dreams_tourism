import 'package:app_dreams_tourism/pages/activity_screen.dart';
import 'package:app_dreams_tourism/widget/global_variavel.dart';
import 'package:flutter/material.dart';
import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ListCardFavorite extends StatefulWidget {
  final List<Activity> activities;

  const ListCardFavorite({Key? key, required this.activities})
      : super(key: key);

  @override
  _ListCardFavoriteState createState() => _ListCardFavoriteState();
}

class _ListCardFavoriteState extends State<ListCardFavorite> {
  void _toggleFavoriteState(Activity activity) async {
    // Define a URL do seu endpoint favorite.php
    final url =
        Uri.parse("${GlobalVariables.ipAddress}/api_dreams_tourism/favorite.php");

    // Faz a solicitação POST com o ID do pacote
    final response = await http.post(url, body: {
      'id': activity.id,
    });

    // Verifica se a solicitação foi bem-sucedida
    if (response.statusCode == 200) {
      // Atualiza o estado local da atividade
      setState(() {
        // Toggle the favorite state
        activity.favoritos = (activity.favoritos == "1") ? "0" : "1";
      });
    } else {
      // Exibe uma mensagem de erro em caso de falha
      print("Erro ao realizar a solicitação HTTP: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtra apenas as atividades favoritas
    List<Activity> favoriteActivities = widget.activities
        .where((activity) => activity.favoritos == "1")
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...favoriteActivities.map((Activity activity) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: GestureDetector(
              onTap: () {
                _navigateToActivityScreen(activity.id, activity);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            // child: Image.asset(
                            //   activity.imageUrl,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              // Chama a função para alternar o estado de favoritos
                              _toggleFavoriteState(activity);
                            },
                            child: Icon(
                              (activity.favoritos == "1")
                                  ? Icons.star
                                  : Icons.star_border,
                              color: (activity.favoritos == "1")
                                  ? Colors.amber
                                  : Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      activity.nomePacote,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    _buildRatingStars(activity.avaliacao),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Tipo: ${activity.tipo}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Cidade: ${activity.cidade}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            DateFormat.Hm().format(
                                                DateTime.parse(
                                                    activity.duracaoInicio)),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            DateFormat.Hm().format(
                                                DateTime.parse(
                                                    activity.duracaoFinal)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'R\$ ${activity.preco}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Por Pessoa',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Text _buildRatingStars(String rating) {
  // Converte a string de rating para um valor inteiro.
  int ratingValue = int.tryParse(rating) ?? 0;

  String stars = '';
  for (int i = 0; i < ratingValue; i++) {
    stars += '⭐ ';
  }
  stars = stars.trim();
  
  return Text(stars);
}


  void _navigateToActivityScreen(String id, Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityScreen(
          id: id,
          activities: widget.activities,
        ),
      ),
    );
  }
}
