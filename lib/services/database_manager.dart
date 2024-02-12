import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart' show kIsWeb;

class DatabaseManager {
  static final DatabaseManager _singleton = DatabaseManager._internal();

  factory DatabaseManager() {
    return _singleton;
  }

  DatabaseManager._internal();

  Future<Database> get database async {
    if (!_initialized) await _init();
    return _database!;
  }

  bool _initialized = false;
  Database? _database;

  Future<void> _init() async {
    if (kIsWeb) {
      // initialisation pour le web de la BDD
      var factory = databaseFactoryWeb;
      _database = await factory.openDatabase('app_database.db');
    } else {
      // initialisation pour les plateformes mobiles
      var dir = await path_provider.getApplicationDocumentsDirectory();
      await dir.create();
      var dbPath = join(dir.path, 'app_database.db');
      var factory = sqflite.databaseFactory;
      _database = (await factory.openDatabase(dbPath)) as Database?;
    }
    _initialized = true;
  }
}
