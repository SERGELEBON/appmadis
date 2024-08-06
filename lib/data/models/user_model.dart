class User {
  final String id;
  final String noms;
  final DateTime dateNaissance;
  final String typePiece;
  final String idPiece;

  User({
    required this.id,
    required this.noms,
    required this.dateNaissance,
    required this.typePiece,
    required this.idPiece,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noms': noms,
      'dateNaissance': dateNaissance.toIso8601String(),
      'typePiece': typePiece,
      'idPiece': idPiece,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      noms: map['noms'],
      dateNaissance: DateTime.parse(map['dateNaissance']),
      typePiece: map['typePiece'],
      idPiece: map['idPiece'],
    );
  }
}
