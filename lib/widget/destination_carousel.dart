import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:app_dreams_tourism/model/destination_model.dart';
import 'package:app_dreams_tourism/pages/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class DestinationCarousel extends StatelessWidget {
  final List<Activity> activities;
  List<Destination> destinations;

  DestinationCarousel({super.key, required this.activities}) : destinations = getDestinations(activities);

  //Define uma classe chamada DestinationCarousel que estende StatelessWidget, indicando que este widget não mantém um estado interno.
  @override
  Widget build(BuildContext context) {
    //Sobrescreve o método build da classe StatelessWidget. Este método é chamado quando o widget precisa ser reconstruído
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
                    Icons.star_rounded, // Substitua pelo ícone desejado
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .color, // Usa a cor do texto
                    size: 24.0,
                  ),
                  const SizedBox(
                      width: 8.0), // Espaçamento entre o ícone e o texto
                  const Text(
                    'Top Destinos',
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
        SizedBox(
          height:
              300.0, //define o espaço entre a descrição e a imagem do box do pacote.
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination, activities: activities,
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width:
                      240.0, //define a disposição da largura dos box de foto dos pacotes
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        top: 180.0,
                        child: Container(
                          width: 230.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Limit description to 4 lines
                                Text(
                                  destination.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                // Add space between description and text box
                                // Center(

                                //   child: Container(
                                //     width: 150,

                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 8.0, vertical: 8.0),
                                //     decoration: BoxDecoration(
                                //       color:
                                //           const Color.fromRGBO(140, 82, 255, 1),
                                //       borderRadius: BorderRadius.circular(5.0),
                                //     ),
                                //     child: Center(
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.min,
                                //         children: [
                                //           Icon(
                                //             Icons.remove_red_eye,
                                //             color: Colors.white,
                                //             size: 20.0,
                                //           ),
                                //           SizedBox(width: 8.0),
                                //           Text(
                                //             'Ver Pacotes',
                                //             style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 16.0,
                                //               fontWeight: FontWeight.w700,
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height:
                                      180.0, //Aqui arruma a distancia do texto com a imagem, na pagina inicial da box.
                                  width:
                                      220.0, // arruma a largura da imagem (tente manter height e width igual)
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          20.0, //define o titulo que fica em cima da imagejm presente na box da página inicial.
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
