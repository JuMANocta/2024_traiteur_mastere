import 'package:flutter/material.dart';
// Importez vos modèles et services nécessaires

class VoirCommandes extends StatelessWidget {
  const VoirCommandes({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple avec des données factices
    final commandes = [
      'Commande 1',
      'Commande 2',
      'Commande 3',
      // Supposons que ce soit vos données de commande
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes'),
      ),
      body: ListView.builder(
        itemCount: commandes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(commandes[index]),
            // Ajoutez plus de détails ici selon votre modèle
          );
        },
      ),
    );
  }
}
