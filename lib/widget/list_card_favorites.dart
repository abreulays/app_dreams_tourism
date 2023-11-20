import 'package:app_dreams_tourism/pages/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_dreams_tourism/model/activity_model.dart';

class ListCardFavorite extends StatefulWidget {
  const ListCardFavorite({Key? key}) : super(key: key);

  @override
  _ListCardFavoriteState createState() => _ListCardFavoriteState();
}

class _ListCardFavoriteState extends State<ListCardFavorite> {
  
  @override
  Widget build(BuildContext context) {
    // Filtra apenas as atividades favoritas
    List<Activity> favoriteActivities =
        activities.where((activity) => activity.favoritos).toList();

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
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 200,
                        //   child: ClipRRect(
                        //     borderRadius: const BorderRadius.only(
                        //       topLeft: Radius.circular(20.0),
                        //       topRight: Radius.circular(20.0),
                        //     ),
                        //     child: Image.asset(
                        //       activity.imageUrl,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the favorite state
                                activity.favoritos = !activity.favoritos;
                              });
                            },
                            child: Icon(
                              activity.favoritos
                                  ? Icons.star
                                  : Icons.star_border,
                              color: activity.favoritos
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
                                    // _buildRatingStars(activity.rating),
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
                                    // Row(
                                    //   children: <Widget>[
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5.0),
                                    //       width: 70.0,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.amber,
                                    //         borderRadius:
                                    //             BorderRadius.circular(10.0),
                                    //       ),
                                    //       alignment: Alignment.center,
                                    //       child: Text(
                                    //         activity.startTimes[0],
                                    //       ),
                                    //     ),
                                    //     const SizedBox(width: 10.0),
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5.0),
                                    //       width: 70.0,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.amber,
                                    //         borderRadius:
                                    //             BorderRadius.circular(10.0),
                                    //       ),
                                    //       alignment: Alignment.center,
                                    //       child: Text(
                                    //         activity.startTimes[1],
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
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

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  void _navigateToActivityScreen(String id, Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityScreen(id: id, activity: activity),
      ),
    );
  }
}
