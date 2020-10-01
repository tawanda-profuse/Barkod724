import '../products.dart';
import '../product.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<Product> _featureProducts = [];
  ProductsService _productsService = ProductsService();

  AppProvider() {
    _getFeaturedProducts();
  }

//  getter
  List<Product> get featureProducts => _featureProducts;

//  methods
  void _getFeaturedProducts() async {
    _featureProducts = await _productsService.getFeaturedProducts();
    notifyListeners();
  }
}
