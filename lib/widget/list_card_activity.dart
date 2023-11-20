import 'package:app_dreams_tourism/pages/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:intl/intl.dart';

class ListCardActivity extends StatefulWidget {
  final List<Activity> activities;
  const ListCardActivity({
    Key? key,
    required this.activities,
  }) : super(key: key);

  @override
  _ListCardActivityState createState() => _ListCardActivityState();
}

class _ListCardActivityState extends State<ListCardActivity> {
  Map<int, bool> isStarFilledMap = {};

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  void _navigateToActivityScreen(Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityScreen(
          id: activity.id,
          activities: widget.activities,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.surfing_rounded,
                    color: Theme.of(context).textTheme.titleLarge!.color,
                    size: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Diversão Garantida',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...widget.activities.map((Activity activity) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: GestureDetector(
              onTap: () {
                _navigateToActivityScreen(activity);
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
                            //   destination.imageUrl,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                int id = int.tryParse(activity.id) ?? 0;
                                isStarFilledMap[id] =
                                    !(isStarFilledMap[id] ?? false);
                              });
                            },
                            child: Icon(
                              isStarFilledMap[int.tryParse(activity.id) ?? 0] ??
                                      (activity.favoritos == '1')
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: isStarFilledMap[
                                          int.tryParse(activity.id) ?? 0] ??
                                      (activity.favoritos == '1')
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
                                    // _buildRatingStars(activity.avaliacao),
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
}
