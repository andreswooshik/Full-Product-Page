import '../models/product.dart';
import '../models/reviews.dart';
import '../models/variataions.dart';
import 'product_repository.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<Product> getProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Product(
      id: id,
      title: "Stylish Pink Dress",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
      price: 17.00,
      image: "assets/topbar.png",
      images: const ["assets/topbar.png", "assets/var1.png", "assets/var2.png"],
      specs: const ProductSpecifications(
        materials: {"Cotton": "95%", "Nylon": "5%"},
        origin: "EU",
        sizes: ["S", "M", "L", "XL"],
      ),
      variations: const [
        Variation(id: "1", color: "Pink", size: "M", image: "assets/var1.png"),
        Variation(id: "2", color: "Blue", size: "M", image: "assets/var2.png"),
        Variation(id: "3", color: "Green", size: "M", image: "assets/var3.png"),
      ],
    );
  }

  @override
  Future<List<Product>> getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      await getProduct("1"),
      await getProduct("2"),
      await getProduct("3"),
    ];
  }

  @override
  Future<List<Product>> getMostPopularProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Product(
        id: "pop1",
        title: "Popular Item 1",
        description: "Description 1",
        price: 15.00,
        image: "assets/mostpopu1.png",
        specs: const ProductSpecifications(),
      ),
      Product(
        id: "pop2",
        title: "Popular Item 2",
        description: "Description 2",
        price: 20.00,
        image: "assets/mostpop3.png",
        specs: const ProductSpecifications(),
      ),
    ];
  }

  @override
  Future<List<Product>> getRecommendedProducts(String productId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return await getMostPopularProducts();
  }

  @override
  Future<List<Review>> getProductReviews(String productId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Review(
        id: "1",
        userName: "Veronika",
        userImage: "assets/veronica.png",
        rating: 4,
        comment: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  @override
  Future<List<Variation>> getProductVariations(String productId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return const [
      Variation(id: "1", color: "Pink", size: "M", image: "assets/var1.png"),
      Variation(id: "2", color: "Blue", size: "M", image: "assets/var2.png"),
      Variation(id: "3", color: "Green", size: "M", image: "assets/var3.png"),
    ];
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final allProducts = await getAllProducts();
    return allProducts
        .where((product) => 
            product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}