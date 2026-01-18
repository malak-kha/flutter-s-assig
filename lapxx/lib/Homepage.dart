import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'animalData.dart';
import 'moreinfo.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AudioPlayer player = AudioPlayer();

  void playSound(String path) async {
    await player.stop();
    await player.play(AssetSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 145, 102, 86),
        title: const Text("Animals Sounds"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(animals: animal),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        animal.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Click to listen"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => playSound(animal.sound),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 145, 102, 86),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
