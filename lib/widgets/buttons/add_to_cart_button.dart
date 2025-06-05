import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/models/product.dart";
import "package:mini_mart/providers/cart_provider.dart";
import "package:mini_mart/widgets/notification_toast/banner_overlay.dart";

class AddToCartButton extends ConsumerWidget {
  final Product product;

  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final isInCart = cartItems.any((item) => item.product.id == product.id);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: isInCart ? Colors.grey[200] : Color(0xFF60B5FF),
      ),
      onPressed: () {
        if (isInCart) {
          // If the product is already in the cart, remove it
          ref.read(cartProvider.notifier).removeItem(product.id);

          // Show custom notification banner using the nearest BannerOverlay ancestor
          BannerOverlay.of(context)
              ?.showBanner("Item has been removed from cart");
          return;
        } else {
          // If the product is not in the cart, add it
          ref.read(cartProvider.notifier).addItem(product);

          // Show custom notification banner using the nearest BannerOverlay ancestor
          // BannerOverlay.of(context)?.showBanner("${product.name} added to cart");
          BannerOverlay.of(context)?.showBanner("Item has been added to cart");
        }
      },
      child: Text(
        isInCart ? "Added to cart" : "Add to cart",
        style: TextStyle(
          color: isInCart ? Colors.grey[500] : Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
