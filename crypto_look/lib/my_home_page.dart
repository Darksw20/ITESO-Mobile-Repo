import 'dart:convert';

import 'package:crypto_look/data/constants.dart';
import 'package:flutter/material.dart';
import 'crypto_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> criptos = [];

  @override
  void initState() {
    criptos = jsonDecode(CRYPTO_EXCHANGES);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Crypto APP"),
        ),
        body: CryptoList(
          criptos: criptos,
        ));
  }
}
