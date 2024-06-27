import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_crud/providers/product_provider.dart';
import 'package:mvvm_crud/views/product_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        hintColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: ProductList(),
    );
  }
}
