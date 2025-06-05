import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/cart_item.dart';
import 'package:mini_mart/models/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      final newState = [...state];
      newState[index] = CartItem(product, state[index].quantity + 1);
      state = newState;
    } else {
      state = [...state, CartItem(product)];
    }
  }

  void removeItem(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void increaseQuantity(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final newState = [...state];
      newState[index] = CartItem(state[index].product, ++state[index].quantity);
      state = newState;
    }
  }

  void decreaseQuantity(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1 && state[index].quantity > 1) {
      final newState = [...state];
      newState[index] = CartItem(state[index].product, --state[index].quantity);
      state = newState;
    }
  }

  void clearCart() {
    state = [];
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  double get shippingCost {
    if (subtotal >= 10000) return 0; // Free shipping for orders over $100
    if (state.isEmpty) return 0; // No shipping cost for empty cart
    return 10; // Fixed shipping cost of $10
  }

  double get total => subtotal + shippingCost;
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
