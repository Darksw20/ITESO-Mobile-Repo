import 'package:crypto_look/details_page.dart';
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
            subtitle: Text(
                '${criptos[index]["country"]}\n ${criptos[index]["year_established"]}'),
            isThreeLine: true,
            leading: Image.network("${criptos[index]["image"]}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                        logoUrl: criptos[index]["image"],
                        name: criptos[index]["name"],
                        date: criptos[index]["year_established"],
                        description: criptos[index]["description"])),
              );
            },
            trailing: CircleAvatar(
              child: Text("${criptos[index]["trust_score"]}"),
            ),
          );
        });
  }
}
