import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_crud/models/product.dart';

class ProductService {
  static const String apiUrl = 'http://10.0.2.2:8000/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      print(response.body);
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((productJson) => Product.fromJson(productJson)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$apiUrl/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<Product> updateProduct(int productId, Product product) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int productId) async {
    final response = await http.delete(Uri.parse('$apiUrl/$productId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    } else {
      print('Product deleted');
    }
  }
}
