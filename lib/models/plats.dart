class Plats {
  final int id;
  final String nom;
  final String description;
  final String image;
  final double prix;

  Plats({
    required this.id,
    required this.nom,
    required this.description,
    required this.image,
    required this.prix,
  });

  factory Plats.fromMap(Map<String, dynamic> map) {
    return Plats(
      id: map['id'],
      nom: map['nom'],
      description: map['description'],
      image: map['image'],
      prix: map['prix'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'description': description,
      'image': image,
      'prix': prix,
    };
  }
}
