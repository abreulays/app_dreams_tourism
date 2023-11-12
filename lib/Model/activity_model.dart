
// define uma classe chamada Activity: Activity é uma classe: Em programação orientada a objetos, uma classe é uma estrutura que 
//define um conjunto de propriedades e métodos que serão compartilhados por todos os objetos criados a partir dessa classe.

class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  Activity({ 
  //isso é um construtor, um  método especial que é chamado quando um novo objeto da classe é criado. Neste caso, estamos obrigando ele  
  //a requerer as propriedades sendo necessária que sejam fornecidas ao criar um novo objeto Activity.
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.startTimes,
    required this.rating,
    required this.price,
  });
}
