import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/widgets/cart_item_card.dart';
import 'package:mini_mart/widgets/custom_app_bar.dart';

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
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ...cartItemsProvider.map((item) => CartItemCard(item: item)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Total: \$${cartNotifier.subtotal.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Checkout not implemented")),
                    );
                  },
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ],
        ),
        // ListView.builder(
        //   itemCount: cartProv.length,
        //   itemBuilder: (context, index) {
        //     final item = cartProv[index];
        //     return CartItemCard(item: item);
        //   },
        // ),
      ),
    );
  }
}
