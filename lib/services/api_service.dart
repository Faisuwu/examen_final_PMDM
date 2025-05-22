import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plat.dart';

class ApiService {
  static const _baseUrl = 'ca409d1161b5dcb680db.free.beeceptor.com';

  Future<List<Plat>> fetchPlats() async {
    final resp = await http.get(Uri.https(_baseUrl,'api/plats'));
    if (resp.statusCode == 200) {
      print(resp.body);
      final Map<String, dynamic> data = json.decode(resp.body);
      return data.values.map((item) => Plat.fromJson(item)).toList();
    } else {
      throw Exception('Error al carregar plats');
    }
  }

  /*
  Future<List<Plat>> fetchPlats2() async {
    final resp = await http.get(Uri.https(_baseUrl,'api/plats'));
    if (resp.statusCode == 200) {
      print(resp.body);
      final Map<String, dynamic> productsMap = json.decode(resp.body);
      productsMap.forEach((key, value) {
        final tempProduct = Plat.fromMap(value);
        tempProduct.id = key as int;
        new Plat(tempProduct.id,tempProduct.nom,...);
      });

    } else {
      throw Exception('Error al carregar plats');
    }
  }*/

  void borrarPlat(Plat plat) async{
    //IMPLEMENTAR BORRARPLAT
  }
  void afegirPlat(Plat plat) async{
    //IMPLEMENTAR AFEGIRPLAT
  }
}