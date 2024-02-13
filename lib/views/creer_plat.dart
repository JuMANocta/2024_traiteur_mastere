import 'package:flutter/material.dart';
import 'package:_2024_traiteur_mastere/models/plat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AjouterPlat extends StatefulWidget {
  const AjouterPlat({super.key});

  @override
  _AjouterPlatState createState() => _AjouterPlatState();
}

class _AjouterPlatState extends State<AjouterPlat> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();

  Future<void> ajouterPlat(Plat plat) async {
    // Remplacez l'URL par l'URL de votre API
    var url = Uri.parse('http://votre-api-url.com/plats');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(plat.toMap()),
    );

    if (response.statusCode == 200) {
      // Gestion de la réponse réussie (vous pouvez ajuster selon vos besoins)
      print('Plat ajouté avec succès');
    } else {
      // Gestion de l'erreur
      print('Erreur lors de l\'ajout du plat');
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _prixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un plat'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _nomController,
                  decoration: const InputDecoration(labelText: 'Nom du plat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'URL de l\'image'),
                ),
                TextFormField(
                  controller: _prixController,
                  decoration: const InputDecoration(labelText: 'Prix'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un prix';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Création de l'objet Plat
                      var nouveauPlat = Plat(
                        id: 0, // L'ID sera généralement généré par l'API
                        nom: _nomController.text,
                        description: _descriptionController.text,
                        image: _imageController.text,
                        prix: double.parse(_prixController.text),
                      );

                      // Appel de la fonction pour ajouter le plat
                      ajouterPlat(nouveauPlat);

                      // Nettoyer les champs après l'envoi
                      _nomController.clear();
                      _descriptionController.clear();
                      _imageController.clear();
                      _prixController.clear();
                    }
                  },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
