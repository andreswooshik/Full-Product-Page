import '../models/product.dart';

abstract class FavoritesService {
  Future<void> addToFavorites(Product product);
  Future<void> removeFromFavorites(Product product);
  Future<List<Product>> getFavoriteItems();
  Future<bool> isFavorite(Product product);
  Future<void> clearFavorites();
  Stream<List<Product>> get favoriteItemsStream;
}