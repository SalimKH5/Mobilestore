import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class BasketProvider extends ChangeNotifier {
  // Storing a list of products
  final List<Product> _products = [];
  num _totalPriceProduct = 0;
  // Getter
  List<Product> get products => _products;

  get totalProduct {
    for (int i = 0; i < _products.length; i++) {
      _totalPriceProduct += _products[i].price;
    }
    return _totalPriceProduct;
  }

  // Setter
  set product(Product? value) {
    if (value != null) {
      _products.add(value);

      // notifyListeners: updates the listeners of the provider
      notifyListeners();
    }
  }
}
