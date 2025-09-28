import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories.dart';
import 'viewmodels.dart';
import 'productdetailpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductDetailViewModel(repository: MockProductRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductDetailPage(productId: '1'),
    );
  }
}