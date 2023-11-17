import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async { //unção principal que inicializa a aplicação Flutter.
  WidgetsFlutterBinding.ensureInitialized(); //Garante que os widgets do Flutter estão inicializados.

  runApp(ChangeNotifierProvider( //usado para gerenciar o estado da aplicação 
      create: (context) => UserModelProvider(), //Este provedor é configurado para fornecer uma instância de UserModelProvider.
      child: const MyApp(),
      // Define MyApp como filho do provedor de estado. Isso significa que MyApp e todos os seus 
      // descendentes terão acesso ao estado gerenciado pelo UserModelProvider.
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
