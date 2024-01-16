import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar: AppBar(
            title: const Text('Gestion Commandes Traiteur'),
        ),
        body: const Center(
            child: Text('Bienvenue dans l\'application de gestion des commandes traiteur !'),
        ),
        );
    }
}