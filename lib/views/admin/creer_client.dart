import 'package:_2024_traiteur_mastere/models/client.dart';
import 'package:_2024_traiteur_mastere/services/data_base_api.dart';
import 'package:flutter/material.dart';

class CreerClient extends StatefulWidget {
  const CreerClient({super.key});

  @override
  _CreerClientState createState() => _CreerClientState();
}

class _CreerClientState extends State<CreerClient> {
  final _formKey = GlobalKey<FormState>();
  // Définition des TextEditingController
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  @override
  void dispose() {
    // Nettoyage des contrôleurs quand le Widget est supprimé
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _adresseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un client'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              TextField(
                controller: _prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _adresseController,
                decoration: const InputDecoration(
                  labelText: 'Adresse',
                ),
              ),
              // placer un espace entre les champs et le bouton
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Utilisation des valeurs des contrôleurs ici
                  final String nom = _nomController.text;
                  final String prenom = _prenomController.text;
                  final String email = _emailController.text;
                  final String adresse = _adresseController.text;
                  // Création de l'objet client
                  Client client = Client(
                    id: 0,
                    nom: nom,
                    prenom: prenom,
                    email: email,
                    adresse: adresse,
                  );
                  // Utiliser le service data_base_api pour ajouter le client
                  bool resultat = await ApiService().creerClient(client);
                  // Vérifier si le widget est toujours monté avant de faire des actions
                  if (mounted) {
                    if (resultat) {
                      // Optionnel: Afficher un message ou naviguer vers une autre page après l'ajout
                      // Pour fermer le clavier après la soumission
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Client ajouté avec succès')));
                    } else {
                      // Pour fermer le clavier après la soumission
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Echec de la création du client')));
                    }
                  }
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
