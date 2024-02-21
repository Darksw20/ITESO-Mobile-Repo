import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.logoUrl,
    required this.name,
    required this.date,
    required this.description,
  });

  final String logoUrl;
  final String name;
  final int date;
  final String description;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Crypto APP"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.logoUrl),
              const SizedBox(height: 10),
              Text(widget.name == "" ? "No disponible" : widget.name),
              const SizedBox(height: 10),
              Text("${widget.date}"),
              const SizedBox(height: 10),
              Image.network(widget.logoUrl),
              const SizedBox(height: 10),
              Text(widget.description == ""
                  ? "No disponible."
                  : widget.description)
            ],
          ),
        ),
      ),
    );
  }
}
