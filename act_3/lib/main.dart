import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Map<String, IconData> iconsMap = {
  'phone': Icons.phone_iphone,
  'accessibility': Icons.accessibility_new,
  'timer': Icons.timer,
  'copy': Icons.content_copy,
  'replay': Icons.replay
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generar Contraseñas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Generar Contraseñas'),
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
  final String _password = "sfadlbjksadnbjkasdfhbn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '32 caracteres:',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(_password),
                          const Row(
                            children: [
                              IconButtonComponent(icon: 'replay'),
                              IconButtonComponent(icon: 'copy'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _IconButtonComponentState extends State<IconButtonComponent> {
  late Color _color = Colors.black;
  late String _password = widget.password;

  String _generatePassword() {
    return "dsadsadsada";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          color: _color,
          icon: Icon(iconsMap[widget.icon] ?? Icons.error),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              widget.password = _generatePassword();
              if (_color == Colors.black) {
                _color = Colors.deepPurple;
              } else {
                _color = Colors.black;
              }
            });
          },
        ),
      ],
    );
  }
}

class IconButtonComponent extends StatefulWidget {
  const IconButtonComponent(
      {super.key, required this.icon, required this.password});
  final String icon;
  final String password;

  @override
  State<IconButtonComponent> createState() => _IconButtonComponentState();
}
