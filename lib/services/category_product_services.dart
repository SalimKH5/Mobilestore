import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/config/config.dart';
import 'package:store/models/product.dart';

class CategoryProductServices {
  /*
    Récupérer tous les produits
    Future équivalent d'une Promise en JS
  */

  Future<List<Product>> getCategoryProduct(String? category) async {
    // Requête en GET
    Uri uri = Uri.parse('${Config.API_URL_CATEGORY}/$category');
    http.Response response = await http.get(uri);

    // Récupérer la réponse
    if (response.statusCode == 200) {
      print(category);

      // Convertir les données en JSON
      List<dynamic> data = jsonDecode(response.body);

      // Renvoyer une liste d'objets
      return data
          .map(
            (dynamic value) => Product(
                id: value['id'],
                title: value['title'],
                price: value['price'],
                description: value['description'],
                category: value['category'],
                image: value['image'],
                rating: value['rating']),
          )
          .toList();
    }
    // Renvoyer une erreur
    else {
      throw Exception('Failed to load products');
    }
  }
}
