import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/product.dart';
import 'package:mini_mart/providers/cart_provider.dart';

class AddToCartButton extends ConsumerWidget {
  final Product product;

  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inCart =
        ref.watch(cartProvider).any((item) => item.product.id == product.id);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: inCart
            ? Colors.lightBlueAccent
            : Colors.blue /*Theme.of(context).primaryColor*/,
      ),
      onPressed: () {
        if (inCart) {
          // If the product is already in the cart, remove it
          ref.read(cartProvider.notifier).removeItem(product.id.toString());

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product.name} removed from cart')));
          return;
        } else {
          // If the product is not in the cart, add it
          ref.read(cartProvider.notifier).addItem(product);

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product.name} added to cart')));
        }
      },
      child: Text(inCart ? 'Added to cart' : 'Add to cart',
          style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
