class Commande {
  final int id;
  final int clientId;
  final double total;
  final String dateCommande;

  Commande({
    required this.id,
    required this.clientId,
    required this.total,
    required this.dateCommande,
  });

  factory Commande.fromMap(Map<String, dynamic> map) {
    return Commande(
      id: map['id'],
      clientId: map['clientId'],
      total: map['total'],
      dateCommande: map['dateCommande'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientId': clientId,
      'total': total,
      'dateCommande': dateCommande,
    };
  }
}