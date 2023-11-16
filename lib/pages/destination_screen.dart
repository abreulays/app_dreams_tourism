import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:app_dreams_tourism/model/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Este é um código que detalha os destinos
//Destination direciona para os destinos, uma classe.

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

//_buildRatingStars converte de números em icones/emogis e afins. Só que nesse caso, converteu para estrela (Star).

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

//Metodo build(BuildContext context)
//Metodo que controi a interface de tela. Divide a tela em duas partes "principais".
//Nesse caso ele está dividindo entre informações e imagem dos pacotes.

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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),

// O widget Hero é usado para criar uma animação de transição suave entre a lista de destinos e esta tela de detalhes.
//Ele permite que a imagem do destino na lista seja animada para a imagem expandida nesta tela.

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
                

              //padding posiciona (margem interna) entre os widget pai e filho. 

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row( //posiciona os itens em linha horizontal.
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.sortAmountDown),
                            iconSize: 25.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
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
                        widget.destination.city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),

                      //O row posiciona os elementos em linha horizontal. 
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            widget.destination.country,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize:  30.0, // descrição BRASIL que fica em cima da imagem do pacote quando se abre a box.
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Positioned e Stack Widgets:posicionar elementos sobrepostos

                Positioned(
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



            //Expanded é usado para organizar/preencher os elementos pai e filho
            //o Expanded é usado para garantir que o ListView.builder dentro de uma Column (ou outro widget flexível)
            //preencha todo o espaço vertical disponível. 

            //itemBuilder: É uma função chamada para construir cada item da lista. Neste caso, ela cria uma Stack para cada atividade.

            //itemCount: Indica o número total de itens na lista, que é obtido a partir do comprimento da lista de atividades do destino.
             
            //A utilização do Expanded é crítica aqui, pois sem ele, o ListView.builder ocuparia apenas o espaço necessário para exibir seus 
            //itens e não se expandiria verticalmente para preencher toda a altura disponível. Com o Expanded, 

            //ListView.builder pode ocupar o espaço restante na Column, garantindo que toda a lista de atividades seja exibida.


            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {Activity
                   activity = widget.destination.activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(
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
                                        'R\$${activity.price}',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
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
                                activity.type,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(activity.rating),
                              SizedBox(height: 10.0),
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
                          child: Image(
                            width: 110.0,
                            image: AssetImage(
                              activity.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
