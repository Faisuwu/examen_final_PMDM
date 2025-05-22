//plat.dart - Antoni Maqueda

import 'dart:convert';

List<Plat> platFromJson(String str) => List<Plat>.from(json.decode(str).map((x) => Plat.fromJson(x)));

String platToJson(List<Plat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//Classe plat amb constructor, .fromJson i .toJson
class Plat {
  int id;
  String nom;
  String descripcio;
  String foto;
  bool disponible;
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




  //FromMap (no se utilitza)

  List<Plat> platFromMap(String str) => List<Plat>.from(json.decode(str).map((x) => Plat.fromMap(x)));

  String platToMap(List<Plat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

  factory Plat.fromMap(Map<String, dynamic> json) => Plat(
    id: json["id"],
    nom: json["nom"],
    descripcio: json["descripcio"],
    foto: json["foto"],
    disponible: json["disponible"],
    tipus: json["tipus"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "descripcio": descripcio,
    "foto": foto,
    "disponible": disponible,
    "tipus": tipus,
  };

}