import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:_2024_traiteur_mastere/views/creer_client.dart';
import 'package:_2024_traiteur_mastere/views/creer_plat.dart';
import 'package:_2024_traiteur_mastere/views/gerer_commandes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Espace Admin', style: monPropreStyleText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: monPropreStyleButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreerClient()),
                      );
                    },
                    child: Text('Créer Client', style: monPropreStyleText),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: monPropreStyleButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AjouterPlat()),
                      );
                    },
                    child: Text(
                      'Ajouter Plat',
                      style: monPropreStyleText,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: monPropreStyleButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VoirCommandes()),
                      );
                    },
                    child: Text('Voir Commandes', style: monPropreStyleText),
                  ),
                ],
              ),
            ),
            //pied de page
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.purple[50],
              child: Text(
                'Traiteur Demo © 2024',
                textAlign: TextAlign.center,
                style: monPropreStyleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle monPropreStyleButton = ElevatedButton.styleFrom(
  foregroundColor: Colors.purple,
  backgroundColor: Colors.white,
  minimumSize: const Size(300, 60),
  shape: const StadiumBorder(
    side: BorderSide(
      color: Colors.purple,
      width: 2.0,
    ),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  elevation: 6,
);

TextStyle monPropreStyleText = GoogleFonts.blackOpsOne(
  textStyle: const TextStyle(
    color: Colors.purple,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);
