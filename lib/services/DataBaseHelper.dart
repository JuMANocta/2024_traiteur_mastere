import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/plat.dart';
import '../models/commande.dart';
import '../models/client.dart';
import '../models/commande_plat.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();
  static Database? _database;

  DataBaseHelper._init();

  
}
