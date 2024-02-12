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

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('traiteur.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE plats (
        id INT PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        description TEXT NOT NULL,
        prix REAL NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE clients (
        id INT PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL,
        adresse TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE commandes (
        id INT PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        total REAL NOT NULL,
        client_id INT NOT NULL,
        FOREIGN KEY (client_id) REFERENCES clients (id)
      )
    ''');
    await db.execute('''
      CREATE TABLE commande_plat (
        id INT PRIMARY KEY AUTOINCREMENT,
        id_commande INT NOT NULL,
        id_plat INT NOT NULL,
        FOREIGN KEY (id_commande) REFERENCES commandes (id),
        FOREIGN KEY (id_plat) REFERENCES plats (id)
      )
    ''');
  }

  // CRUD de plat
  //C
  Future<Plat> createPlat(Plat plat) async {
    final db = await database;
    final id = await db.insert('plats', plat.toMap());
    return Plat(
        id: id,
        nom: plat.nom,
        description: plat.description,
        image: plat.image,
        prix: plat.prix);
  }

  //R
  Future<Plat?> readPlat(int id) async {
    // SELECT * FROM plats WHERE id = id
    final db = await database;
    final maps = await db.query(
      'plats',
      columns: ['id', 'nom', 'description', 'image', 'prix'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Plat.fromMap(maps.first);
    } else {
      return null;
    }
  }

  //U
  Future<int> updatePlat(Plat plat) async {
    final db = await database;
    return db.update(
      'plats',
      plat.toMap(),
      where: 'id = ?',
      whereArgs: [plat.id],
    );
  }

  //D
  Future<int> deletePlat(int id) async {
    final db = await database;
    return await db.delete(
      'plat',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD de client
  //C
  Future<Client> createClient(Client client) async {
    final db = await database;
    final id = await db.insert('clients', client.toMap());
    return Client(
        id: id,
        nom: client.nom,
        prenom: client.prenom,
        email: client.email,
        adresse: client.adresse);
  }

  //R
  Future<Client?> readClient(int id) async {
    // SELECT * FROM clients WHERE id = id
    final db = await database;
    final maps = await db.query(
      'clients',
      columns: ['id', 'nom', 'prenom', 'email', 'adresse'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Client.fromMap(maps.first);
    } else {
      return null;
    }
  }

  //U
  Future<int> updateClient(Client client) async {
    final db = await database;
    return db.update(
      'clients',
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  //D
  Future<int> deleteClient(int id) async {
    final db = await database;
    return await db.delete(
      'clients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD de commande.dart
  //C
  Future<Commande> createCommande(Commande commande) async {
    final db = await database;
    final id = await db.insert('commandes', commande.toMap());
    return Commande(
      id: id,
      clientId: commande.clientId,
      total: commande.total,
      dateCommande: commande.dateCommande,
    );
  }

  //R
  Future<Commande?> readCommande(int id) async {
    final db = await database;
    final maps = await db.query(
      'commandes',
      columns: ['id', 'clientId', 'total', 'dateCommande'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Commande.fromMap(maps.first);
    } else {
      return null;
    }
  }

  //U
  Future<int> updateCommande(Commande commande) async {
    final db = await database;
    return db.update(
      'commandes',
      commande.toMap(),
      where: 'id = ?',
      whereArgs: [commande.id],
    );
  }
  
  //D
  Future<int> deleteCommande(int id) async {
    final db = await database;
    return await db.delete(
      'commandes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
//C
Future<CommandePlat> createCommandePlat(CommandePlat commandePlat) async {
  final db = await database;
  final id = await db.insert('commande_plats', commandePlat.toMap());
  return CommandePlat(
    id: id,
    idCommande: commandePlat.idCommande,
    idPlat: commandePlat.idPlat,
    quantite: commandePlat.quantite,
  );
}

//R
Future<CommandePlat?> readCommandePlat(int id) async {
  final db = await database;
  final maps = await db.query(
    'commande_plats',
    columns: ['id', 'commandeId', 'platId', 'quantite'],
    where: 'id = ?',
    whereArgs: [id],
  );
  if (maps.isNotEmpty) {
    return CommandePlat.fromMap(maps.first);
  } else {
    return null;
  }
}

//U
Future<int> updateCommandePlat(CommandePlat commandePlat) async {
  final db = await database;
  return db.update(
    'commande_plats',
    commandePlat.toMap(),
    where: 'id = ?',
    whereArgs: [commandePlat.id],
  );
}

//D
Future<int> deleteCommandePlat(int id) async {
  final db = await database;
  return await db.delete(
    'commande_plats',
    where: 'id = ?',
    whereArgs: [id],
  );
}
  

  // Fermeture de la BDD
  Future closeBdd() async {
    final db = await instance.database;
    db.close();
  }
}
