import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/widgets/cart_item_card.dart';
import 'package:mini_mart/widgets/buttons/checkout_button.dart';
import 'package:mini_mart/widgets/app_bar/custom_app_bar.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsProvider = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);

    if (cartItemsProvider.isEmpty) {
      return Center(
        child: Text("Your cart is empty."),
      );
    }
    return Scaffold(
      appBar: CustomAppBar(title: "Your Cart"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ...cartItemsProvider.map((item) => CartItemCard(item: item)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 8,
                    children: [
                      const SizedBox(height: 16),
                      Text("Order info",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${cartNotifier.subtotal.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${cartNotifier.shippingCost.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${cartNotifier.total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CheckoutButton(onCheckout: () {
              cartNotifier.clearCart();
              // Navigator.of(context).pushNamed("/checkout");
            }),
          ],
        ),
      ),
    );
  }
}
