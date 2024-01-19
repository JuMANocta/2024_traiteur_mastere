class CommandePlat{
  final int id;
  final int idCommande;
  final int idPlat;

  CommandePlat({
    required this.id,
    required this.idCommande,
    required this.idPlat,
  });

  factory CommandePlat.fromMap(Map<String, dynamic> map) {
    return CommandePlat(
      id: map['id'],
      idCommande: map['idCommande'],
      idPlat: map['idPlat'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCommande': idCommande,
      'idPlat': idPlat,
    };
  }

}