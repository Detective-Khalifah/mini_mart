import "package:flutter/material.dart";
import "package:mini_mart/models/product.dart";
import "package:mini_mart/widgets/product_card.dart";

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
    this.category,
    this.isAtHome = false,
  });

  final bool isAtHome;
  final String? category;
  final String title;

  static const List<Product> _products = [
    Product(
      id: 0,
      name: "Apple iPhone 16",
      description: [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified supplieres.",
        "There will be no visible cosmetic imperfections when held at arm's length."
      ],
      specs: ["128GB", "Teal"],
      price: 700.00,
      imagePath: "assets/images/iphone.png",
    ),
    Product(
      id: 1,
      name: "M4 Macbook Air 13\"",
      description: [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified supplieres.",
        "There will be no visible cosmetic imperfections when held at arm's length."
      ],
      specs: ["256GB", "Sky blue"],
      price: 1000,
      imagePath: "assets/images/macbook.png",
    ),
    Product(
      id: 2,
      name: "Google Pixel 9A",
      description: [
        "Google Pixel 9A is a smartphone that features a 6.1-inch display with a resolution of 1080 x 2400 pixels.",
        "It is powered by a Google Tensor G3 processor and comes with 8GB of RAM and 128GB of internal storage."
      ],
      specs: ["128GB", "Iris"],
      price: 499,
      imagePath: "assets/images/google_pixel.png",
    ),
    Product(
      id: 3,
      description: [
        "Apple Airpods 4 are the latest wireless earbuds from Apple, featuring improved sound quality, longer battery life, and seamless integration with Apple devices.",
        "They come with a compact charging case and support for spatial audio."
      ],
      specs: ["Active Noise Cancellation", "Spatial Audio"],
      name: "Apple Airpods 4",
      price: 129,
      imagePath: "assets/images/airpod.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isAtHome
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed("/blank"),
              ),
        automaticallyImplyLeading: !isAtHome,
        title: Text(title),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (category != null)
                Text(
                  category!,
                  style: TextStyle(fontSize: 24),
                ),
              const SizedBox(height: 16),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: _products[index],
                  );
                },
                itemCount: _products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
