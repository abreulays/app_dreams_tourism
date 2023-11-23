import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:app_dreams_tourism/model/destination_model.dart';
import 'package:app_dreams_tourism/pages/activity_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  final List<Activity> activities;

  const DestinationScreen(
      {super.key, required this.destination, required this.activities});

  @override
  // ignore: library_private_types_in_public_api
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
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

  void _navigateToActivityScreen(String id) {
    // Activity activity = widget.activities.firstWhere((activity) => activity.id == id);
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

  bool isStateInRegion(String region, String state) {
    // Mapeamento de regiões para estados correspondentes
    Map<String, List<String>> regionsMap = {
      'norte': ['ac', 'ap', 'am', 'pa', 'ro', 'rr', 'to'],
      'nordeste': ['al', 'ba', 'ce', 'ma', 'pb', 'pe', 'pi', 'rn', 'se'],
      'centro-oeste': ['df', 'go', 'mt', 'ms'],
      'sudeste': ['es', 'mg', 'rj', 'sp'],
      'sul': ['pr', 'rs', 'sc'],
    };

    // Converte as strings para minúsculas para garantir a comparação insensível a maiúsculas e minúsculas
    region = region.toLowerCase();
    state = state.toLowerCase();

    // Verifica se o estado faz parte da região
    return regionsMap[region]?.contains(state) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    tag: widget.destination.imageUrl,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image: AssetImage(widget.destination.imageUrl),
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
                      // Row(
                      //   children: <Widget>[
                      //     IconButton(
                      //       icon: const Icon(Icons.search),
                      //       iconSize: 30.0,
                      //       color: Colors.black,
                      //       onPressed: () => Navigator.pop(context),
                      //     ),
                      //     IconButton(
                      //       // ignore: deprecated_member_use
                      //       icon: const Icon(FontAwesomeIcons.sortAmountDown),
                      //       iconSize: 25.0,
                      //       color: Colors.black,
                      //       onPressed: () => Navigator.pop(context),
                      //     ),
                      //   ],
                      // ),
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
                        widget.destination.region,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
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
                            widget.destination.country,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize:
                                  30.0, // descrição BRASIL que fica em cima da imagem do pacote quando se abre a box.
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];

                  // Verifica se o estado faz parte da região
                  bool isInRegion = isStateInRegion(
                      widget.destination.region, activity.estado);

                  if (isInRegion) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToActivityScreen(activity.id);
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                            height: 170.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  100.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 120.0,
                                        child: Text(
                                          activity.nomePacote,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'R\$${activity.preco}',
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'Por Pessoa',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    activity.tipo,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  _buildRatingStars(activity.avaliacao),
                                  const SizedBox(height: 10.0),
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
                                          DateFormat.Hm().format(DateTime.parse(
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
                                          DateFormat.Hm().format(DateTime.parse(
                                              activity.duracaoFinal)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 15.0,
                            bottom: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                imageUrl: activity.imageUrl,
                                fit: BoxFit.cover,
                                width: 110.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Pula para a próxima iteração se o estado não pertence à região
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
