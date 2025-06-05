import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/providers/cart_provider.dart";
import "package:mini_mart/widgets/notification_toast/banner_overlay.dart";

class CheckoutButton extends ConsumerWidget {
  final VoidCallback onCheckout;

  const CheckoutButton({
    super.key,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(cartProvider.notifier).total;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: total > 0 ? Color(0xFF60B5FF) : Colors.grey.shade200,
      ),
      onPressed: () {
        if (total > 0) {
          // If the product is already in the cart, remove it
          ref.read(cartProvider.notifier).clearCart();

          BannerOverlay.of(context)
              ?.showBanner("Payment processing may be added later");
          onCheckout;
          return;
        } else {
          BannerOverlay.of(context)?.showBanner("Uh, there's noting to pay");
        }
      },
      child: Text(
        "Checkout (\$${total.toStringAsFixed(0)})",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
