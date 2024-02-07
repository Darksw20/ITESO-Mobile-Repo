import 'package:flutter/material.dart';
import 'dart:developer';

const List<Map<String, dynamic>> hourlyForecast = [
  {'hour': 'Now', 'temp': 16, 'img': 'moon'},
  {'hour': '12 AM', 'temp': 14, 'img': 'moon'},
  {'hour': '1 AM', 'temp': 14, 'img': 'moon'},
  {'hour': '2 AM', 'temp': 13, 'img': 'moon'},
  {'hour': '3 AM', 'temp': 11, 'img': 'moon'},
];

const List<Map<String, dynamic>> weeklyForecast = [
  {'day': 'today', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Tuesday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Wednesday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Thursday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Friday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Saturday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Sunday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Monday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Tuesday', 'img': 'sun', 'max': '28', 'min': '9'},
  {'day': 'Wednesday', 'img': 'sun', 'max': '28', 'min': '9'}
];

const Map<String, IconData> iconsMap = {
  'phone': Icons.phone_iphone,
  'accessibility': Icons.accessibility_new,
  'timer': Icons.timer,
  'moon': Icons.nightlight_round,
  'sun': Icons.light_mode
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(0, 50, 86, 1),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Column(
          children: [
            Text(
              "Hourly forecast",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            HourlyCard(forecast: hourlyForecast),
            Text(
              "10-day forecast",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            WeeklyCard(forecast: weeklyForecast),
          ],
        ),
      ),
    );
  }
}

class WeeklyCard extends StatelessWidget {
  final List<Map<String, dynamic>> forecast;

  const WeeklyCard({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: const Color.fromRGBO(0, 50, 86, 1),
        child: SizedBox(
          width: 300,
          height: 450,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 5);
            },
            scrollDirection: Axis.vertical,
            itemCount: forecast.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: .5),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(240, 0, 29, 53),
                    borderRadius: BorderRadius.vertical(
                      top: index == 0 ? const Radius.circular(12) : Radius.zero,
                      bottom: index == forecast.length - 1
                          ? const Radius.circular(12)
                          : Radius.zero,
                    ),
                  ),
                  child: WeeklyItem(data: forecast[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HourlyCard extends StatelessWidget {
  final List<Map<String, dynamic>> forecast;

  const HourlyCard({Key? key, required this.forecast}) : super(key: key);

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
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: forecast.length,
                  itemBuilder: (context, index) {
                    return HourlyItem(data: forecast[index]);
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
  final Map<String, dynamic> data;

  const HourlyItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "${data['temp']}°",
            style: const TextStyle(color: Colors.white),
          ),
          IconButtonComponent(icon: data['img']),
          Text(
            data['hour'],
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WeeklyItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const WeeklyItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              data['day'],
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButtonComponent(icon: data['img']),
                const SizedBox(width: 30),
                Text(
                  "${data['max']}°/${data['min']}°",
                  style: const TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IconButtonComponent extends StatefulWidget {
  final String icon;

  const IconButtonComponent({Key? key, required this.icon}) : super(key: key);

  @override
  State<IconButtonComponent> createState() => _IconButtonComponentState();
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
