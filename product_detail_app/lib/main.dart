import 'package:flutter/material.dart';
import 'providers/app_providers.dart';
import 'pages/product_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Product Page",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppTheme.backgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppTheme.backgroundColor,
            elevation: 0,
            iconTheme: IconThemeData(color: AppTheme.textPrimary),
          ),
        ),
        home: const ProductPage(productId: "1"),
      ),
    );
  }
}