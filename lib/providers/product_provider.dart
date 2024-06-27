import 'package:flutter/foundation.dart';
import 'package:mvvm_crud/models/product.dart';
import 'package:mvvm_crud/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  List<Product> _products = [];

  List<Product> get products => [..._products];

  Future<void> fetchProducts() async {
    try {
      _products = await _productService.fetchProducts();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch products: $e');
    }
  }

  Future<void> createProduct(Product product) async {
    try {
      Product newProduct = await _productService.createProduct(product);
      _products.add(newProduct);
      notifyListeners();
    } catch (e) {
      print('Failed to create product: $e');
    }
  }

  Future<void> updateProduct(int productId, Product product) async {
    try {
      await _productService.updateProduct(productId, product);
      int index = _products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        _products[index] = product;
        notifyListeners();
      }
    } catch (e) {
      print('Failed to update product: $e');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      await _productService.deleteProduct(productId);
      _products.removeWhere((p) => p.id == productId);
      notifyListeners();
    } catch (e) {
      print('Failed to delete product: $e');
    }
  }
}
