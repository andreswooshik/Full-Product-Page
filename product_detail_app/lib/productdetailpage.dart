import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels.dart';
import 'widgets/product_image_gallery.dart';
import 'widgets/variation_selector.dart';
import 'models.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductDetailViewModel>().loadProduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading || viewModel.product == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final product = viewModel.product!;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              ProductImageGallery(
                images: product.images,
                isFavorite: viewModel.isFavorite,
                onFavoritePressed: viewModel.toggleFavorite,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column( // Changed from children to child
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductHeader(context, product),
                      const SizedBox(height: 24),
                      VariationSelector(
                        variations: product.variations,
                        images: product.images,  // Add this parameter
                      ),
                      const SizedBox(height: 24),
                      SpecificationsSection(
                        specifications: product.specifications,
                      ),
                      const SizedBox(height: 24),
                      _buildDeliveryOptions(product, viewModel),
                      const SizedBox(height: 24),
                      _buildReviews(product.reviews),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: _buildBottomBar(viewModel),
        );
      },
    );
  }

  Widget _buildProductHeader(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        // Images are now handled in VariationSelector
      ],
    );
  }

  Widget _buildDeliveryOptions(Product product, ProductDetailViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery', 
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...product.deliveryMethods.map((method) => RadioListTile<String>(
          title: Text(method.name),
          subtitle: Text('${method.eta} - \$${method.price.toStringAsFixed(2)}'),
          value: method.id,
          groupValue: viewModel.selectedDeliveryId,
          onChanged: (value) {
            if (value != null) viewModel.selectDeliveryMethod(value);
          },
        )),
      ],
    );
  }

  Widget _buildReviews(List<Review> reviews) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rating & Reviews', 
                style: Theme.of(context).textTheme.titleLarge),
            TextButton(
              onPressed: () {
                // Handle view all reviews
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...reviews.map((review) => ListTile(
          leading: CircleAvatar(
            child: Text(review.user[0]),
          ),
          title: Row(
            children: [
              Text(review.user),
              const SizedBox(width: 8),
              ...List.generate(5, (index) => Icon(
                index < review.rating.floor() 
                    ? Icons.star 
                    : Icons.star_border,
                size: 16,
                color: Colors.amber,
              )),
            ],
          ),
          subtitle: Text(review.text),
        )),
      ],
    );
  }

  Widget _buildBottomBar(ProductDetailViewModel viewModel) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: viewModel.addToCart,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Add to cart'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: viewModel.buyNow,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Buy now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecificationsSection extends StatelessWidget {
  final List<Specification> specifications;

  const SpecificationsSection({
    super.key, // Updated to use super.key
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ...specifications.map(
          (spec) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spec.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: spec.details.map((detail) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(detail),
                )).toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}