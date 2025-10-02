import '../models/product.dart';
import '../models/reviews.dart';
import '../models/variataions.dart';

abstract class ProductRepository {
  Future<Product> getProduct(String id);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getMostPopularProducts();
  Future<List<Product>> getRecommendedProducts(String productId);
  Future<List<Review>> getProductReviews(String productId);
  Future<List<Variation>> getProductVariations(String productId);
  Future<List<Product>> searchProducts(String query);
}