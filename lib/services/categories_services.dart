import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';

class CategoriesServices {
  /*
    Récupérer tous les produits
    Future équivalent d'une Promise en JS
  */
  Future<List<String>> getCategory() async {
    // Requête en GET
    Uri uri = Uri.parse(Config.API_URL_CATEGORIES);
    http.Response response = await http.get(uri);

    // Récupérer la réponse
    if (response.statusCode == 200) {
      // Convertir les données en JSON
      List<dynamic> data = jsonDecode(response.body);

      // Renvoyer une liste d'objets
      return data.map<String>((dynamic value) => value.toString()).toList();
    }
    // Renvoyer une erreur
    else {
      throw Exception('Failed to load products');
    }
  }
}
