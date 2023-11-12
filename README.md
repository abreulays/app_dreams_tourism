# Projeto Dreams Tourism

Projeto desenvolvido com a proposta de atender ao requisitos do TCC.

## Tecnologia Usadas

- Java
- Flutter
- Dart
- API

## Plataforma
Aplicativo exclusivo para a plataforma Android.

## O que é JAVA?
Java é uma linguagem de programação orientada a objetos desenvolvida na década de 90 por uma equipe de programadores chefiada por James Gosling, na empresa Sun Microsystems, que em 2008 foi adquirido pela empresa Oracle Corporation.

## O que é DART?
Dart é uma linguagem de script voltada à web desenvolvida pela Google. Ela foi lançada na GOTO Conference 2011, que aconteceu de 10 a 11 de outubro de 2011 em Aarhus, na Dinamarca. O objetivo da linguagem Dart foi inicialmente a de substituir a JavaScript como a linguagem principal embutida nos navegadores.

## O que é uma API?
As interfaces de programação de aplicativos (APIs) são conjuntos de ferramentas, definições e protocolos para a criação de aplicações de software. APIs conectam soluções e serviços, sem a necessidade de saber como esses elementos foram implementados.

Neste projeto por exemplo, criamos uma API em PHP que faz conexão com o banco de dados SQL Server, recebendo parametros e retornando resultados para sereme exibidos e tratados dentro do Flutter.

## O que é Flutter?
O Flutter é um framework de interface de usuário (UI) gratuito e de código aberto, criado pelo Google e lançado em maio de 2017. Ele permite que os desenvolvedores criem aplicativos móveis nativos para Android e iOS usando a mesma base de código.

O Flutter funciona renderizando os elementos da interface do usuário (UI) diretamente em um Canvas, uma camada de desenho que é parte fundamental do sistema operacional. Isso permite que o Flutter crie aplicativos que são tão rápidos e responsivos quanto os aplicativos nativos.

Quando o Flutter é usado para desenvolver um aplicativo Android, ele cria um arquivo de artefatos, chamado de APK, que pode ser instalado em qualquer dispositivo Android. O APK contém todos os recursos necessários para executar o aplicativo, incluindo o código Dart, os arquivos de recursos e o código Java.

O código Java no APK é usado para acessar as APIs do sistema operacional Android. Por exemplo, o código Java pode ser usado para acessar os sensores do dispositivo, conectar-se à internet ou interagir com o sistema de arquivos.

O código Java no APK é compilado pelo Android Studio, o IDE oficial do Android. O Android Studio usa o Gradle, um sistema de gerenciamento de dependências, para gerenciar as dependências de código Java do Flutter.

Aqui está um exemplo de como o Flutter usa o código Java para acessar os sensores do dispositivo:

// Código Dart

class MySensorsPage extends StatefulWidget {
  @override
  _MySensorsPageState createState() => _MySensorsPageState();
}

class _MySensorsPageState extends State<MySensorsPage> {
  late SensorManager sensorManager;

  @override
  void initState() {
    super.initState();
    sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensores')),
      body: Center(
        child: Column(
          children: [
            // ...
            Text(
              'Acelerômetro: ${sensorManager.getSensorList(Sensor.TYPE_ACCELEROMETER).first.name}',
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
Este código cria uma página que exibe o nome do sensor de acelerômetro. O código Java para acessar o sensor de acelerômetro é fornecido pelo Android SDK.

O Flutter também permite que os desenvolvedores usem o código Java para acessar as APIs do Google Play. Por exemplo, o código Java pode ser usado para acessar o Google Maps, o Google Cloud Platform ou o Google Play Billing.

Aqui está um exemplo de como o Flutter usa o código Java para acessar o Google Maps:

// Código Dart

class MyMapPage extends StatefulWidget {
  @override
  _MyMapPageState createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    // Cria um mapa
    mapController = GoogleMapController(
      // ...
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa')),
      body: Center(
        child: GoogleMap(
          // ...
          controller: mapController,
        ),
      ),
    );
  }
}
Este código cria uma página que exibe um mapa. O código Java para acessar o Google Maps é fornecido pelo Google Maps SDK.

Em geral, o Flutter é uma ferramenta poderosa que permite aos desenvolvedores criar aplicativos móveis nativos para Android e iOS usando a mesma base de código. O Flutter fornece uma maneira eficiente e eficaz de desenvolver aplicativos móveis com a flexibilidade do código Dart e a confiabilidade do código Java.



## O que é Flutter?
Flutter é um framework de código aberto desenvolvido pelo Google para criar interfaces de usuário (UI) nativas em plataformas móveis, web e desktop a partir de um único código-fonte. Ele utiliza a linguagem de programação Dart, não Java. Entretanto, quando se refere a desenvolver aplicativos Android com Flutter, é comum mencionar a integração do Flutter com Java.

Vamos esclarecer a relação entre Flutter e Java no contexto do desenvolvimento Android:

Flutter usa Dart:

Dart é a linguagem de programação principal usada pelo Flutter. O código-fonte do Flutter é escrito em Dart, que é uma linguagem moderna e orientada a objetos.
Enquanto o Flutter não utiliza Java como linguagem principal, ele interage com a Máquina Virtual Java (JVM) por meio do Flutter Engine.
Flutter Engine e NDK:

O Flutter Engine é um componente essencial do Flutter que é escrito em C++ para oferecer um desempenho excepcional.
Quando um aplicativo Flutter é compilado para Android, o Flutter Engine é incorporado no APK.
O Flutter Engine interage diretamente com o NDK (Android Native Development Kit) para executar tarefas intensivas em termos de desempenho.
Integração com Java:

Apesar de a lógica do aplicativo Flutter ser escrita em Dart, você pode integrar facilmente módulos escritos em Java ao seu aplicativo Flutter.
O Flutter oferece canais de comunicação bidirecionais (chamados de "platform channels") que permitem a comunicação entre o código Dart e o código nativo, como Java no Android.
Isso significa que, se você já possui código Java existente ou se deseja utilizar uma biblioteca específica do Android escrita em Java, é possível integrá-la ao seu aplicativo Flutter.
Uso de Plugins:

Muitos plugins e pacotes para Flutter são escritos em Dart, mas podem envolver código nativo escrito em Java (ou Kotlin).
Esses plugins permitem acessar recursos nativos do dispositivo Android, como câmera, sensores e outros.
Desenvolvimento Multiplataforma:

Uma das principais vantagens do Flutter é a capacidade de criar aplicativos nativos para várias plataformas, incluindo Android e iOS, usando um único código-fonte.
Embora Java seja a linguagem predominante no desenvolvimento Android tradicional, o Flutter elimina a necessidade de manter dois conjuntos de código para plataformas diferentes.
Ferramentas e IDEs:

O desenvolvimento de aplicativos Flutter pode ser feito em vários ambientes de desenvolvimento integrado (IDEs), incluindo Android Studio e Visual Studio Code.
As ferramentas de desenvolvimento são ajustadas para trabalhar eficientemente com o Flutter e Dart, independentemente da linguagem utilizada no desenvolvimento nativo Android.
Em resumo, ao desenvolver um aplicativo Android com Flutter, você utiliza principalmente a linguagem Dart para a lógica do aplicativo, mas pode integrar e interagir facilmente com código Java existente, aproveitando as vantagens do desenvolvimento multiplataforma fornecidas pelo Flutter.