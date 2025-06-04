import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/models/cart_item.dart";
import "package:mini_mart/providers/cart_provider.dart";

class CartItemCard extends ConsumerStatefulWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  ConsumerState<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final cartItemProvider = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);

    final currentQuantity = cartItemProvider
        .firstWhere((item) => item.product.id == widget.item.product.id)
        .quantity;
    return Dismissible(
      key: Key(widget.item.product.id.toString()),
      background: Container(color: Colors.red),
      onDismissed: (_) => cartNotifier.removeItem(widget.item.product.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(widget.item.product.imagePath,
                  width: 100, height: 100),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.item.product.name,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.item.product.specs.join("|"),
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$${widget.item.product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "In stock",
                      style: TextStyle(
                        color: Color(0xFF10B981),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 16,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 32,
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey.shade500,
                              weight: 1.5,
                              size: 36,
                            ),
                            onPressed: () {
                              // setState(() {
                              cartNotifier.decreaseQuantity(
                                widget.item.product.id,
                              );
                              // });
                            },
                          ),
                        ),
                        Text(
                          "${currentQuantity}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 32,
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.grey.shade700,
                                size: 36,
                                weight: 1.5,
                              ),
                              onPressed: () {
                                // setState(() {
                                cartNotifier.increaseQuantity(
                                  widget.item.product.id,
                                );
                                // });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Color(0xFF999999),
                              size: 36,
                              weight: 1.23,
                            ),
                            onPressed: () {
                              cartNotifier.removeItem(widget.item.product.id);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
