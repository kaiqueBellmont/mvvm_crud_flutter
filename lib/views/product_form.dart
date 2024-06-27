import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_crud/models/product.dart';
import 'package:mvvm_crud/providers/product_provider.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late double _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Product newProduct = Product(
                      name: _name,
                      description: _description,
                      price: _price,
                    );
                    try {
                      await Provider.of<ProductProvider>(context, listen: false)
                          .createProduct(newProduct);
                      Navigator.pop(context);
                    } catch (e) {
                      print('Failed to create product: $e');
                      // Handle error
                    }
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
