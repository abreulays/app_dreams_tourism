import 'package:app_dreams_tourism/model/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:app_dreams_tourism/model/activity_model.dart';

class ListCardActivity extends StatelessWidget {
  const ListCardActivity({Key? key});

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: activities.map((Activity activity) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem no topo do card
                  Container(
                    width: double.infinity,
                    height: 200, // Ajuste a altura conforme necessário
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: Image.asset(
                        activity.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Detalhes da atividade
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Type: ${activity.type}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Price: ${activity.price}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        // Outros detalhes da atividade
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                activity.startTimes[0],
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                activity.startTimes[1],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildRatingStars(activity.rating),
                        Text(
                          'City: ${activity.city}',
                          style: TextStyle(fontSize: 14),
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
    );
  }
}
