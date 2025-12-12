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
            color: Colors.lightBlue[200],
            padding: EdgeInsets.all(16),
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Row with A, B, C buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColoredButton(text: "A", color: Colors.red),
                    ColoredButton(text: "B", color: Colors.orange),
                    ColoredButton(text: "C", color: Colors.yellow[700]!),
                  ],
                ),
                SizedBox(height: 20),

                // Fancy Section
                Container(
                  width: double.infinity,
                  color: Colors.blue[100],
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

                      // 2 rows of numbers 1 2 3 and 4 5 6 with different purple shades
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberBox(number: "1", color: Colors.purple[700]!),
                          NumberBox(number: "2", color: Colors.purple),
                          NumberBox(number: "3", color: Colors.purple[300]!),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberBox(number: "4", color: Colors.purple[400]!),
                          NumberBox(number: "5", color: Colors.purple[200]!),
                          NumberBox(number: "6", color: Colors.pink[200]!),
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
                        InfoCard(number: "23", text: "Active", color: const Color.fromARGB(255, 0, 0, 0)),
                        InfoCard(number: "15", text: "Pending", color: Color.fromARGB(255, 10, 10, 9)),
                        InfoCard(number: "7", text: "Completed", color: const Color.fromARGB(255, 5, 6, 5)),
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

class ColoredButton extends StatelessWidget {
  final String text;
  final Color color;

  ColoredButton({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: contrastTextColor(color),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class NumberBox extends StatelessWidget {
  final String number;
  final Color color;

  NumberBox({required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: color,
      alignment: Alignment.center,
      child: Text(
        number,
        style: TextStyle(
          color: contrastTextColor(color),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String number;
  final String text;
  final Color color;

  InfoCard({required this.number, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: color.computeLuminance() > 0.5 ? Colors.black : color,
            ),
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}