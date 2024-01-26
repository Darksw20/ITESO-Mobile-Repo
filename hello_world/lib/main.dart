import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Happy Birthday Frank",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Expanded(
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/002/036/729/original/birthday-cake-cartoon-doodle-hand-drawn-concept-kawaii-illustration-vector.jpg")),
              Text("From Mike")
            ],
          )),
    );
  }
}
