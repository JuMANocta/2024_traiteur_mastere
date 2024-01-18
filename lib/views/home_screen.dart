import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Commandes Traiteur'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Catalogue des plats'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Gestion des commandes'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Espace client'),
          ),
        ],
      )),
    );
  }
}
