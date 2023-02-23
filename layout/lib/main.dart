import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Layout Exam"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/tak.jpg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.beach_access,
                      color: Colors.blue,
                    ),
                    Text(
                      'My Std Id is 64130500249',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Text(
                  "My name is Sitiporn",
                  style: TextStyle(fontSize: 32, color: Colors.red),
                ),
                const Text(
                  "Wimolpunyakul",
                  style: TextStyle(fontSize: 32, color: Colors.red),
                )
              ],
            )));
  }
}
