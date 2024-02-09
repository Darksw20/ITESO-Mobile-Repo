import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imc;
  const DetailsPage({
    super.key,
    required this.imc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles"),
      ),
      body: Column(children: [
        Text("IMC: $imc"),
        Text("!"),
      ]),
    );
  }
}
