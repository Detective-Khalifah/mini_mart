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
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        '/view_product',
        arguments: product,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "product_image_${product.id}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imagePath,
                width: 240,
                height: 160,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:
                        Text('Image not found', style: TextStyle(fontSize: 16)),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 4),
          Hero(
            tag: "product_name_${product.id}",
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Hero(
            tag: "product_specs_${product.id}",
            child: Text(
              product.specs.join("|"),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              // style: TextStyle(fontSize: 16),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          Hero(
            tag: "product_price_${product.id}",
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
