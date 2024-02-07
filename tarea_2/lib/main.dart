import 'package:flutter/material.dart';
import 'dart:developer';

const hourlyForecast = [
  {'hour': 'Now', 'temp': 16, 'img': 'moon'},
  {'hour': '12 AM', 'temp': 14, 'img': 'moon'},
  {'hour': '1 AM', 'temp': 14, 'img': 'moon'},
  {'hour': '2 AM', 'temp': 13, 'img': 'moon'},
  {'hour': '3 AM', 'temp': 11, 'img': 'moon'},
];
const weeklyForecast = [
  {'day': 'today', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Tuesday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Wednesday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Thursday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Friday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Saturday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Sunday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Monday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Tuesday', 'img': 'sun', 'max': '28', 'min': 9},
  {'day': 'Wednesday', 'img': 'sun', 'max': '28', 'min': 9}
];

const Map<String, IconData> iconsMap = {
  'phone': Icons.phone_iphone,
  'accessibility': Icons.accessibility_new,
  'timer': Icons.timer
};

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
          scaffoldBackgroundColor: const Color.fromRGBO(0, 50, 86, 1),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: Column(children: [
            Text("Hourly forecast",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white)),
            HourlyCard(),
            Text("10-day forecast",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white)),
            WeeklyCard(),
          ]),
        ));
  }
}

class WeeklyCard extends StatelessWidget {
  const WeeklyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(240, 0, 29, 53),
        child: SizedBox(
          width: 300,
          height: 450,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            scrollDirection: Axis.vertical,
            itemCount: weeklyForecast.length,
            itemBuilder: (context, index) {
              return const WeeklyItem();
            },
          ),
        ),
      ),
    );
  }
}

class HourlyCard extends StatelessWidget {
  const HourlyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(240, 0, 29, 53),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                // Wrap ListView.separated with Expanded
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyForecast.length,
                  itemBuilder: (context, index) {
                    return const HourlyItem();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyItem extends StatelessWidget {
  const HourlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: <Widget>[
        Text("16°", style: TextStyle(color: Colors.white)),
        IconButtonComponent(icon: 'accessibility'),
        Text("Now", style: TextStyle(color: Colors.white)),
      ]),
    );
  }
}

class WeeklyItem extends StatelessWidget {
  const WeeklyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Today", style: TextStyle(color: Colors.white)),
            IconButtonComponent(icon: 'accessibility'),
            Text("18°/9°", style: TextStyle(color: Colors.white)),
          ]),
    );
  }
}

class _IconButtonComponentState extends State<IconButtonComponent> {
  late Color _color = Colors.white;

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
