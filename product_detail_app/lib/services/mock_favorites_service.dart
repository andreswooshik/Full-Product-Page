import 'dart:async';
import '../models/product.dart';
import 'favorites_service.dart';

class MockFavoritesService implements FavoritesService {
  final List<Product> _favoriteItems = [];
  final StreamController<List<Product>> _favoritesController = StreamController<List<Product>>.broadcast();

  @override
  Future<void> addToFavorites(Product product) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!_favoriteItems.any((item) => item.id == product.id)) {
      _favoriteItems.add(product);
      _favoritesController.add(List.from(_favoriteItems));
    }
  }

  @override
  Future<void> removeFromFavorites(Product product) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _favoriteItems.removeWhere((item) => item.id == product.id);
    _favoritesController.add(List.from(_favoriteItems));
  }

  @override
  Future<List<Product>> getFavoriteItems() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.from(_favoriteItems);
  }

  @override
  Future<bool> isFavorite(Product product) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _favoriteItems.any((item) => item.id == product.id);
  }

  @override
  Future<void> clearFavorites() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _favoriteItems.clear();
    _favoritesController.add(List.from(_favoriteItems));
  }

  @override
  Stream<List<Product>> get favoriteItemsStream => _favoritesController.stream;
}