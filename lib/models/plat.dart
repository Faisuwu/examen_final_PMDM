import 'dart:convert';

List<Plat> platFromJson(String str) => List<Plat>.from(json.decode(str).map((x) => Plat.fromJson(x)));

String platToJson(List<Plat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plat {
  int id;
  String nom;
  String descripcio;
  String foto;
  String disponible;
  String tipus;

  Plat({
    required this.id,
    required this.nom,
    required this.descripcio,
    required this.foto,
    required this.disponible,
    required this.tipus,
  });

  factory Plat.fromJson(Map<String, dynamic> json) => Plat(
    id: json["id"],
    nom: json["nom"],
    descripcio: json["descripcio"],
    foto: json["foto"],
    disponible: json["disponible"],
    tipus: json["tipus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "descripcio": descripcio,
    "foto": foto,
    "disponible": disponible,
    "tipus": tipus,
  };
}