import "package:mini_mart/models/product.dart";

class Constants {
  static const List<Product> products = [
    Product(
      id: 0,
      name: "Apple iPhone 16",
      description: [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
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
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
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
}
