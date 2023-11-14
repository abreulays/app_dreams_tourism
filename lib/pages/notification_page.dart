import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(140, 82, 255, 1), // Defina a cor roxa desejada
        elevation: 0, // Remova a sombra
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notificações'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification 1'),
            subtitle: Text('Details of Notification 1'),
          ),
          ListTile(
            title: Text('Notification 2'),
            subtitle: Text('Details of Notification 2'),
          ),

          // Adicionar mais widgets ListTile para notificações adicionais
        ],
      ),
    );
  }
}
