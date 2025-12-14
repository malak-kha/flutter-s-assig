// lib/main.dart

import 'package:flutter/material.dart';
// يجب التأكد من صحة مسار الاستيراد لملف البيانات
import 'assig2.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // لإزالة الشريط الأحمر (Debug) في الزاوية
      debugShowCheckedModeBanner: false, 
      title: 'Poke App Clone',
      theme: ThemeData(
        // لون شريط التطبيق الرئيسي
        primarySwatch: Colors.cyan, 
        useMaterial3: false,
      ),
      home: const PokemonGridScreen(),
    );
  }
}

class PokemonGridScreen extends StatelessWidget {
  const PokemonGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الشريط العلوي (AppBar)
      appBar: AppBar(
        backgroundColor: Colors.cyan[400], 
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Poke App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      
      // جسم الصفحة (Body) الذي يحتوي على شبكة الصور
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        // إعدادات الشبكة (عمودان)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.85, 
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        // يتم الاعتماد على حجم القائمة المحدثة (6 عناصر)
        itemCount: pokemonList.length, 
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return PokemonGridItem(pokemon: pokemon);
        },
      ),
      
      // زر العائمة (Floating Action Button)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // يمكن إضافة دالة تحديث البيانات هنا
        },
        backgroundColor: Colors.cyan[400],
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}

// تصميم العنصر الواحد في الشبكة
class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonGridItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // الصورة (Image Widget)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                pokemon.imagePath, // سيعرض m1.png إلى m6.png
                fit: BoxFit.contain,
              ),
            ),
          ),
          // اسم العنصر (Text Widget)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
            child: Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}