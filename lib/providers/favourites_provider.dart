import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart/models/product.dart';

class FavouritesNotifier extends StateNotifier<List<Product>> {
  FavouritesNotifier() : super([]);

  void toggleFavourite(Product product) {
    if (state.contains(product)) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  void clearFavourites() {
    state = [];
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Product>>(
        (ref) => FavouritesNotifier());
