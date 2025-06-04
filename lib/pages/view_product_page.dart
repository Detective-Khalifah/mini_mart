import 'package:flutter/material.dart';
import 'package:mini_mart/models/product.dart';
import 'package:mini_mart/widgets/add_to_cart_button.dart';

class ViewProductPage extends StatefulWidget {
  const ViewProductPage({super.key, required this.product});

  final Product? product;

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        title: Text("Go back"),
      ),
      body: widget.product == null
          ? Center(child: Text("Product unavailable"))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Hero(
                              tag: "product_image_${widget.product!.id}",
                              child: ClipRRect(
                                child: Image.asset(
                                  widget.product!.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                // Handle favorite action
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "${widget.product!.name} added to favorites"),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.favorite_outline),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(
                          child: Hero(
                            tag: "product_name_${widget.product!.id}",
                            child: Text(
                              widget.product!.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Hero(
                            tag: "product_specs",
                            child: Text(
                              widget.product!.specs.join(" | "),
                              softWrap: true,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Hero(
                      tag: "product_price_${widget.product!.id}",
                      child: Text(
                        "\$${widget.product!.price.toStringAsFixed(2)}",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontWeight: FontWeight.w900),
                        // const TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "About this item",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Wrap(
                        children: widget.product!.description.map((descItem) {
                          return Text(
                            "- $descItem",
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AddToCartButton(product: widget.product!),
                  ],
                ),
              ),
            ),
    );
  }
}
