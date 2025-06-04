import 'package:flutter/material.dart';
import 'package:mini_mart/models/product.dart';

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
          : SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/${widget.product!.name}.png",
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product!.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text("About this item"),
                  Wrap(
                    children: widget.product!.description.map((descItem) {
                      return Text(
                        descItem,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                    },
                    child: const Text("Add to Cart"),
                  ),
                ],
              ),
            ),
    );
  }
}
