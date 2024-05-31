import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  // stocker un produit
  String? _catgory;

  // getter / setter
  String? get category => _catgory;

  set category(String? value) {
    _catgory = value;
    // notifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}
