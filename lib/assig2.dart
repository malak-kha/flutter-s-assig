// lib/pokemon_model.dart

class Pokemon {
  final String name;
  final String imagePath;

  Pokemon({required this.name, required this.imagePath});
}

// القائمة تحتوي على 6 عناصر فقط، والمسارات تم تحديثها من 1.png إلى m6.png
final List<Pokemon> pokemonList = [
  Pokemon(name: 'Bulbasaur', imagePath: 'assets/images/1.jpg'),
  Pokemon(name: 'Ivysaur', imagePath: 'assets/images/2.jpg'),
  Pokemon(name: 'Venusaur', imagePath: 'assets/images/3.jpg'),
  Pokemon(name: 'Charmander', imagePath: 'assets/images/4.jpg'),
  Pokemon(name: 'Charmeleon', imagePath: 'assets/images/5.jpg'),
  Pokemon(name: 'Charizard', imagePath: 'assets/images/6.jpg'),
];