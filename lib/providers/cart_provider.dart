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
      newState[index] =
          CartItem(state[index].product, state[index].quantity + 1);
      state = newState;
    }
  }

  void decreaseQuantity(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (state[index].quantity <= 1) {
        removeItem(productId);
      } else {
        final newState = [...state];
        newState[index] =
            CartItem(state[index].product, state[index].quantity - 1);
        state = newState;
      }
    }
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
