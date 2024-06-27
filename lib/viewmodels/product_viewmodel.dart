import 'package:flutter/material.dart';
import 'package:mvvm_crud/models/product.dart';
import 'package:mvvm_crud/services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  ProductService _productService = ProductService();

  Future<List<Product>> fetchProducts() async {
    try {
      return await _productService.fetchProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
