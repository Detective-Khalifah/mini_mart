import 'package:flutter/material.dart';
import 'package:mini_mart/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/product_detail',
          arguments: product,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, //.stretch seems to work better for web and larger screen devices...
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: "product_image_${product.imagePath}",
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('Image not found')),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Hero(
                tag: "product_name_${product.id}",
                child: Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Hero(
                tag: "product_specs_${product.id}",
                child: Text(
                  product.specs.join("|"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 8),
              Hero(
                tag: "product_price_${product.id}",
                child: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
