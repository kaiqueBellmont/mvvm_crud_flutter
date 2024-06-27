import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_crud/models/product.dart';
import 'package:mvvm_crud/providers/product_provider.dart';
import 'package:mvvm_crud/views/product_detail.dart';
import 'package:mvvm_crud/views/product_form.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.pink[200],
      ),
      body: productProvider.products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                Product product = productProvider.products[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag, color: Theme.of(context).hintColor),
                    title: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    subtitle: Text(product.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await Provider.of<ProductProvider>(context, listen: false)
                            .deleteProduct(product.id!);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
