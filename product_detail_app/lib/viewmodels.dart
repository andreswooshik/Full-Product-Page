import 'package:flutter/foundation.dart';
import 'repositories.dart';
import 'models.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final IProductRepository repository;
  Product? product;
  bool isFavorite = false;
  String? selectedVariationId;
  String? selectedDeliveryId;
  String? error;
  bool isLoading = false;

  ProductDetailViewModel({required this.repository});

  Future<void> loadProduct(String productId) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();
      
      product = await repository.fetchProductById(productId);
      
      if (product!.variations.isNotEmpty) {
        selectedVariationId = product!.variations.first.id;
      }
      if (product!.deliveryMethods.isNotEmpty) {
        selectedDeliveryId = product!.deliveryMethods.first.id;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    if (product != null) {
      repository.toggleFavorite(product!.id, isFavorite);
    }
    notifyListeners();
  }

  void selectVariation(String variationId) {
    selectedVariationId = variationId;
    notifyListeners();
  }

  void selectDeliveryMethod(String deliveryId) {
    selectedDeliveryId = deliveryId;
    notifyListeners();
  }

  void addToCart() {
    if (product != null && selectedVariationId != null && selectedDeliveryId != null) {
      repository.addToCart(product!.id, selectedVariationId!, selectedDeliveryId!);
    }
  }

  void buyNow() {
    if (product != null && selectedVariationId != null && selectedDeliveryId != null) {
      repository.createOrder(product!.id, selectedVariationId!, selectedDeliveryId!);
    }
  }
}