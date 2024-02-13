import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:_2024_traiteur_mastere/models/client.dart';

class ClientService {
  final String _baseUrl = 'http://localhost:5000/api/clients';

  Future<bool> creerClient(Client client) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Echec de la création du client');
    }
  }
}
