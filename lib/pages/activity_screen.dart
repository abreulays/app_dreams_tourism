import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ActivityScreen extends StatefulWidget {
  final String id;
    final List<Activity> activities;


  const ActivityScreen({Key? key, required this.id, required this.activities,})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late Activity activity;

  @override
  void initState() {
    super.initState();
    // Aqui você deve buscar a atividade correspondente ao ID
    // Substitua o código abaixo pela lógica de busca na sua lista de atividades
    activity = widget.activities.firstWhere((element) => element.id == widget.id);
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


  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Lottie.asset(
                  'lib/assets/images/check.json',
                  repeat: false,
                  reverse: false,
                  animate: true,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Compra Realizada',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );

    // Aguarde 3 segundos e depois redirecione para PedidosPage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Fecha o diálogo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: activity.imageUrl,
                            child: ClipRRect(
                              child: CachedNetworkImage(
                              imageUrl: activity.imageUrl,
                              fit: BoxFit.cover,
                              
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                iconSize: 30.0,
                                color: Colors.black,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 20.0,
                          bottom: 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                activity.nomePacote,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(
                                    FontAwesomeIcons.locationArrow,
                                    size: 15.0,
                                    color: Colors.white70,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    activity.cidade,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          right: 20.0,
                          bottom: 20.0,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Descrição:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            activity.descricaoLugar,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Preço:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'R\$ ${activity.preco} por pessoa',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Período:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
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
                                    ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Avaliação:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          _buildRatingStars(activity.avaliacao),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(0, 255, 193, 7),
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: TextButton.icon(
                onPressed: () {
                  _showPopup(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(140, 82, 255, 1),
                ),
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'Comprar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
