import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(140, 82, 255, 1), // Defina a cor roxa desejada
        elevation: 0, // Remova a sombra
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Notificações'),
      ),
      body: ListView(
        children: const [
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
