import '../models/product.dart';

abstract class CartService {
  Future<void> addToCart(Product product);
  Future<void> removeFromCart(Product product);
  Future<void> updateQuantity(Product product, int quantity);
  Future<List<Product>> getCartItems();
  Future<void> clearCart();
  Stream<List<Product>> get cartItemsStream;
  Future<double> getTotalPrice();
}