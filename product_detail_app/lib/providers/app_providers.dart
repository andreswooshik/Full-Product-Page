import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import '../services/favorites_service.dart';
import '../services/product_repository.dart';
import '../services/mock_cart_service.dart';
import '../services/mock_favorites_service.dart';
import '../services/mock_product_repository.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  
  const AppProviders({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductRepository>(
          create: (_) => MockProductRepository(),
        ),
        Provider<CartService>(
          create: (_) => MockCartService(),
        ),
        Provider<FavoritesService>(
          create: (_) => MockFavoritesService(),
        ),
      ],
      child: child,
    );
  }
}