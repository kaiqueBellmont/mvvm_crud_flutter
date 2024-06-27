import 'dart:convert';

class Product {
  int? id;

  String name;
  String description;
  double price;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: utf8.decode(json['name'].codeUnits),
      description: utf8.decode(json['description'].codeUnits),
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
