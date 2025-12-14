import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Helper: choose readable text color (black or white) against a background
Color contrastTextColor(Color background) {
  return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Row with A, B, C buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageButton(text: "A", image: "assets/img1.png"),
                    ImageButton(text: "B", image: "assets/img2.png"),
                    ImageButton(text: "C", image: "assets/img1.png"),
                  ],
                ),
                SizedBox(height: 20),

                // Fancy Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        "Fancy Section",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageNumberBox(number: "1", image: "assets/img2.png"),
                          ImageNumberBox(number: "2", image: "assets/img1.png"),
                          ImageNumberBox(number: "3", image: "assets/img2.png"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageNumberBox(number: "4", image: "assets/1.png"),
                          ImageNumberBox(number: "5", image: "assets/2.png"),
                          ImageNumberBox(number: "6", image: "assets/3.png"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Info Cards section
                Column(
                  children: [
                    Text(
                      "Info Cards",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageInfoCard(number: "23", text: "Active", image: "assets/img1.png"),
                        ImageInfoCard(number: "15", text: "Pending", image: "assets/img1.png"),
                        ImageInfoCard(number: "7", text: "Completed", image: "assets/img1.png"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Button with image background
class ImageButton extends StatelessWidget {
  final String text;
  final String image;

  ImageButton({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          width: 70,
          height: 50,
          fit: BoxFit.cover,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

// Number box with image background
class ImageNumberBox extends StatelessWidget {
  final String number;
  final String image;

  ImageNumberBox({required this.number, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}

// Info card with image background
class ImageInfoCard extends StatelessWidget {
  final String number;
  final String text;
  final String image;

  ImageInfoCard({required this.number, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
