import 'package:app_dreams_tourism/model/activity_model.dart';
import 'package:app_dreams_tourism/model/user_model.dart';
import 'package:app_dreams_tourism/pages/notification_page.dart';
import 'package:app_dreams_tourism/widget/list_card_activity.dart';
import 'package:app_dreams_tourism/widget/destination_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

// aqui temos a declaração de uma classe que se chama ScreenHomePage que extende a classe StatefulWidget.
class ScreenHomePage extends StatefulWidget {
  final UserModel user;
  final List<Activity> activities;

//O UserModel é um modelo de dados que representa informações sobre um usuário.
//A palavra-chave final indica que o valor da variável não pode ser alterado após ser atribuído.

  const ScreenHomePage({Key? key, required this.user, required this.activities, }) : super(key: key);
//const é um contrutor que da classe ScreenHomePage que usa como parametros o Key (que ajuda a identificar os widgets)
//que chama como parâmetros o valor obrigátorio user do tipo UserModel.
//A chamada super(key: key) chama o construtor padrão "pai" (StatefulWidget) passando a chave fornecida.

// é um método que cria e retorna uma instância.
//Override é o que permite a classe padrão "pai" retorne para as outras o que ele requer. Exemplo:
// Por exemplo, a classe Animal pode ter um método chamado fazerBarulho(). A classe Cachorro pode ser uma subclasse de Animal
// e pode sobrescrever o método fazerBarulho() para fornecer uma implementação específica para cachorros.
  @override
  // ignore: library_private_types_in_public_api
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

//nesse caso, _selectedIndex armazena o indice dos icones selecionados. Iniciando em zero,
//que indica que FontAwesomeIcons.plane é o primeiro
class _ScreenHomePageState extends State<ScreenHomePage> {
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    // ignore: deprecated_member_use
    FontAwesomeIcons.walking,
    // ignore: deprecated_member_use
    FontAwesomeIcons.biking,
  ];

//Widget _buildIcon(int index): Define um método privado _buildIcon que recebe um índice como parâmetro e retorna um widget.
//Este método é responsável por criar um widget GestureDetector para cada ícone na lista. Um GestureDetector detecta gestos
//do usuário, como toques.

// onTap: () { setState(() { _selectedIndex = index; }); }: Dentro do GestureDetector, há um onTap que é um callback chamado
// quando o usuário toca no ícone. Quando o usuário toca em um ícone, o método setState é chamado. O setState notifica o framework Flutter de que o estado interno deste widget mudou,
//  e ele precisa ser reconstruído. Neste caso, o _selectedIndex é atualizado com o índice do ícone tocado.

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromRGBO(140, 82, 255, 1)
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromARGB(255, 196, 180, 195),
        ),
      ),
    );
  }

//  Esta anotação @override indica que o método build está sobrescrevendo um método da classe pai. No contexto do Flutter,
// o método build  é responsável por construir a hierarquia de widgets que compõem a interface do usuário.

//  O método build retorna um widget e recebe como parâmetro um contexto (BuildContext). O contexto fornece informações
//  sobre a posição deste widget na árvore de widgets do aplicativo.

// O widget Scaffold é uma estrutura básica de página que fornece a estrutura visual básica de uma tela. Ele geralmente contém
// uma barra de aplicativos (AppBar), corpo (body), gaveta de navegação (drawer), entre outros.

//SafeArea é usado para garantir que o conteúdo do aplicativo não fique oculto pelas áreas sensíveis, como a barra de status no
//topo ou a barra de navegação na parte inferior, em dispositivos com entalhes ou barras.
// O body do Scaffold é envolto por SafeArea para garantir que o conteúdo seja exibido de maneira segura.

//SingleChildScrollView é usado para permitir rolar o conteúdo da tela quando o espaço vertical é limitado.
  //Ele envolve o Column que contém o conteúdo da tela.

  //Column coloca todos os elementos em colunas verticais. Paqdding é espaço do widge pai.
  //Nesse caso a column está em volta de um padding para acionar espaço horizontal e vertical.

  //row organiza os "filhos" em uma unica linha horizontal. Nesse caso tudo os elementos na parte superiror da tela.

//mainAxisAlignment: MainAxisAlignment.end,: MainAxisAlignment é usado para alinhar os filhos em uma direção principal.
// Neste caso, end alinha os elementos no final da linha horizontal.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Adicionar o ícone de notificação

// GestureDetector(: GestureDetector é usado para detectar gestos do usuário, como toques. Ele envolve o ícone de notificação
// e permite a navegação para a NotificationPage quando é tocado.

                    GestureDetector(
                      // onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage(),),); },:
                      //  O onTap é um callback chamado quando o usuário toca no ícone de notificação. Quando o ícone de notificação é tocado,
                      // é iniciada uma navegação para a página NotificationPage usando
                      // Navigator.push. Isso cria uma transição de tela, empurrando a nova página sobre a tela atual
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                      },

                      // child: Container(: Container é um widget que pode conter outros widgets e
                      // é usado para definir margens, preenchimentos e decorações para o conteúdo que ele contém.
                      child: Container(
                        padding: const EdgeInsets.all(
                            10.0), // Aumentar o tamanho do ícone

                        child: const Icon(
                          Icons.notifications,
                          size: 30.0, // Aumentar o tamanho do ícone
                          color: Color.fromRGBO(140, 82, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const SizedBox(
                        width:
                            10.0), // Adiciona algum espaço entre o texto e o nome do usuário
                    Text(
                      'Bora se aventurar, \n${widget.user.nome.split(' ')[0]}?',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

// SizedBox(height: 20.0),: SizedBox é um widget que cria um espaço vertical com uma altura especificada. Neste caso, está sendo
// adicionado um espaço vertical de 20 pixels.
//  Isso é usado para separar visualmente o conteúdo.

// mainAxisAlignment: MainAxisAlignment.spaceAround,: MainAxisAlignment é usado para alinhar os filhos do Row na direção principal,
//  que é horizontal neste caso. spaceAround distribui
//  o espaço entre os filhos de modo que haja espaço igual em torno de cada filho

              Center(
                child: Lottie.asset("lib/assets/images/plane_home.json"),
              ),
              const SizedBox(height: 20.0),
              DestinationCarousel(activities: widget.activities), //carrousel de destinos com a lista de destinos
              // const SizedBox(height: 0.0),
              ListCardActivity(activities: widget.activities),
            ],
          ),
        ),
      ),
    );
  }
}
