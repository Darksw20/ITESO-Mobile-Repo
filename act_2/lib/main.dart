import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clima",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        color: Colors.orange,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'San Francisco',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              const Text(
                'Nublado',
                style: TextStyle(color: Colors.white),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.wb_cloudy,
                    size: 50,
                    color: Color.fromARGB(255, 100, 166, 213),
                  ),
                  Text(
                    "19C",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  )
                ],
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: const Text("Actualizar Datos"),
                ),
              )
            ]),
      ),
    );
  }
}
