class CommandePlat {
  final int id;
  final int idCommande;
  final int idPlat;
  final int quantite;

  CommandePlat({
    required this.id,
    required this.idCommande,
    required this.idPlat,
    required this.quantite
  });

  factory CommandePlat.fromMap(Map<String, dynamic> map) {
    return CommandePlat(
      id: map['id'],
      idCommande: map['idCommande'],
      idPlat: map['idPlat'],
      quantite: map['quantite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCommande': idCommande,
      'idPlat': idPlat,
      'quantite': quantite,
    };
  }
}
