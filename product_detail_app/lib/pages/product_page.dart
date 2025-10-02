import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_header.dart';
import '../widgets/product_variations.dart';
import '../widgets/product_specs.dart' as specs_widget;
import '../widgets/product_delivery.dart';
import '../widgets/product_reviews.dart';
import '../widgets/product_most_popular.dart';
import '../widgets/product_recommendations.dart';
import '../services/product_repository.dart';
import '../services/cart_service.dart';
import '../services/favorites_service.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Consumer3<ProductRepository, CartService, FavoritesService>(
      builder: (context, productRepo, cartService, favoritesService, child) {
        return FutureBuilder<Product>(
          future: productRepo.getProduct(productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: Text('Product not found')),
              );
            }
            
            final product = snapshot.data!;
            return _buildProductPage(context, product, cartService, favoritesService);
          },
        );
      },
    );
  }
  
  Widget _buildProductPage(BuildContext context, Product product, 
      CartService cartService, FavoritesService favoritesService) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductHeader(),
              const ProductVariations(),
              const specs_widget.ProductSpecs(),
              const ProductDelivery(),
              const ProductReviews(),
              const ProductMostPopular(),
              const ProductRecommendations(),
              const SizedBox(height: 100), // Extra space for bottom navigation
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context, product, cartService, favoritesService),
    );
  }
  
  Widget _buildBottomBar(BuildContext context, Product product, 
      CartService cartService, FavoritesService favoritesService) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Bottom indicator line
        Container(
          height: 4,
          width: 50,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                // Heart/Favorite button
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FutureBuilder<bool>(
                    future: favoritesService.isFavorite(product),
                    builder: (context, snapshot) {
                      final isFavorite = snapshot.data ?? false;
                      return IconButton(
                        onPressed: () async {
                          if (isFavorite) {
                            await favoritesService.removeFromFavorites(product);
                          } else {
                            await favoritesService.addToFavorites(product);
                          }
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                
                // Add to cart button
                Expanded(
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await cartService.addToCart(product);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Buy now button
                Expanded(
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await cartService.addToCart(product);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Proceed to checkout!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007AFF), // iOS blue
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Buy now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}