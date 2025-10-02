import 'dart:async';
import '../models/product.dart';
import 'cart_service.dart';

class MockCartService implements CartService {
  final List<Product> _cartItems = [];
  final StreamController<List<Product>> _cartController = StreamController<List<Product>>.broadcast();

  @override
  Future<void> addToCart(Product product) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.add(product);
    _cartController.add(List.from(_cartItems));
  }

  @override
  Future<void> removeFromCart(Product product) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.removeWhere((item) => item.id == product.id);
    _cartController.add(List.from(_cartItems));
  }

  @override
  Future<void> updateQuantity(Product product, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (quantity <= 0) {
      await removeFromCart(product);
    }
  }

  @override
  Future<List<Product>> getCartItems() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.from(_cartItems);
  }

  @override
  Future<void> clearCart() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.clear();
    _cartController.add(List.from(_cartItems));
  }

  @override
  Stream<List<Product>> get cartItemsStream => _cartController.stream;

  @override
  Future<double> getTotalPrice() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _cartItems.fold<double>(0.0, (double total, Product product) => total + product.price);
  }
}