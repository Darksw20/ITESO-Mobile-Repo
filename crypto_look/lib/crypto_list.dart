import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key, required this.criptos});

  final List criptos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: criptos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${criptos[index]["name"]}"),
            subtitle: Text("test2"),
            trailing: CircleAvatar(
              child: Text("text"),
            ),
          );
        });
  }
}
