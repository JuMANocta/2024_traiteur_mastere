import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Traiteur Demo',
              textStyle: monPropreStyleText,
              speed: const Duration(milliseconds: 200),
            ),

            // RotateAnimatedText('Traiteur Demo', textStyle: monPropreStyleText),

            // TyperAnimatedText('Traiteur Demo', textStyle: monPropreStyleText),

            // ColorizeAnimatedText(
            //   'Bon appetito !',
            //   textStyle: GoogleFonts.blackOpsOne(
            //     textStyle: const TextStyle(
            //       fontSize: 50,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   colors: [
            //     Colors.purple,
            //     Colors.blue,
            //     Colors.yellow,
            //     Colors.red,
            //   ],
            // ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'Catalogue',
                child: ListTile(
                    leading: Icon(Icons.food_bank),
                    title: Text('Catalogue des plats')),
              ),
              const PopupMenuItem(
                value: 'commandes',
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Gestion des commandes'),
                ),
              ),
              const PopupMenuItem(
                  value: 'client',
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Espace client'),
                  )),
            ],
          )
        ],
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
                  onPressed: () => {print('Catalogue des plats')},
                  child: Text(
                    'Catalogue des plats',
                    style: monPropreStyleText,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: monPropreStyleButton,
                  onPressed: () => {print('Gestion des commandes')},
                  child: Text(
                    'Gestion des commandes',
                    style: monPropreStyleText,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: monPropreStyleButton,
                  onPressed: () => {print('Espace client')},
                  child: Text(
                    'Espace client',
                    style: monPropreStyleText,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
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
