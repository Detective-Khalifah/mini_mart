import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/cart_item.dart';
import 'package:mini_mart/models/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      state[index] = CartItem(product, state[index].quantity + 1);
    } else {
      state = [...state, CartItem(product)];
    }
  }

  void removeItem(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(String productId, int newQty) {
    if (newQty < 1) return removeItem(productId);

    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      state[index] = CartItem(state[index].product, newQty);
    }
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
