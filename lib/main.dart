import 'package:_2024_traiteur_mastere/services/data_base_helper.dart';
import 'package:flutter/material.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // créer la BDD ou l'utiliser
  final DataBaseHelper db = DataBaseHelper.instance;
  await db.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traiteur Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: const Locale('fr', 'FR'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
