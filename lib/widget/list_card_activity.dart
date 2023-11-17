import 'package:app_dreams_tourism/model/destination_model.dart';
import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_dreams_tourism/model/activity_model.dart';

class ListCardActivity extends StatelessWidget {
  

  const ListCardActivity({Key? key, required this.user});
final UserModel user;
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
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
                'lib/assets/images/check.json', // Substitua pelo caminho do seu arquivo Lottie
                repeat: false,
                reverse: false,
                animate: true,
              ),
            ),
            const SizedBox(height: 10),
            Text(
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
  });
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
        ...activities.map((Activity activity) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        activity.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                    activity.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  _buildRatingStars(activity.rating),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Tipo: ${activity.type}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Cidade: ${activity.city}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'R\$ ${activity.price}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Por Pessoa',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 10),
                                TextButton.icon(
                                  onPressed: () {
                                    _showPopup(context);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(140, 82, 255, 1),
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
                                const SizedBox(width: 8),
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
          );
        }).toList(),
      ],
    );
  }
}
