import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

const Map<String, IconData> iconsMap = {
  'phone': Icons.phone_iphone,
  'accessibility': Icons.accessibility_new,
  'timer': Icons.timer
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mc Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Mc Flutter'),
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: CardComponent())],
          )),
    );
  }
}

class CardComponent extends StatelessWidget {
  const CardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50.0),
            child: const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Flutter McFlutter'),
              subtitle: Text('Experienced App Developer'),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("123 Main Street"),
              Text("(415) 555-0198"),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButtonComponent(icon: 'accessibility'),
              IconButtonComponent(icon: 'timer'),
              IconButtonComponent(icon: 'phone'),
              IconButtonComponent(icon: 'phone'),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconButtonComponentState extends State<IconButtonComponent> {
  late Color _color = Colors.black;

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
              log('data: ${widget.icon}');
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
  const IconButtonComponent({super.key, required this.icon});
  final String icon;

  @override
  State<IconButtonComponent> createState() => _IconButtonComponentState();
}
