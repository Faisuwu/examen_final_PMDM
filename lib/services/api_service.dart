import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plat.dart';

class ApiService {
  static const _baseUrl = 'https://ca409d1161b5dcb680db.free.beeceptor.com/api';

  Future<List<Plat>> fetchPlats() async {
    final resp = await http.get(Uri.parse('$_baseUrl/plats.json'));
    if (resp.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(resp.body);
      return data.values.map((item) => Plat.fromJson(item)).toList();
    } else {
      throw Exception('Error al carregar plats');
    }
  }
  void borrarPlat(Plat plat) async{
    //IMPLEMENTAR BORRARPLAT
  }
  void afegirPlat(Plat plat) async{
    //IMPLEMENTAR AFEGIRPLAT
  }
}