import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestion Commandes Traiteur', 
          style: monPropreStyleText,
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context)=> [
              const PopupMenuItem(
                value: 'Catalogue',
                child: ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text ('Catalogue des plats')
                ),
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
                )
              ),
            ],
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: monPropreStyleButton,
            onPressed: () => {},
            child: Text(
              'Catalogue des plats', 
              style: monPropreStyleText,),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: monPropreStyleButton,
            onPressed: () => {},
            child: Text(
              'Gestion des commandes', 
              style: monPropreStyleText,),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: monPropreStyleButton,
            onPressed: () => {},
            child: Text(
              'Espace client', 
              style: monPropreStyleText,
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

TextStyle monPropreStyleText = const TextStyle(
  color: Colors.purple,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);