class Product {
  final int id;
  final String name;
  final List<String> description, specs;
  final double price;
  final String imagePath;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.specs,
    required this.price,
    required this.imagePath,
  });

  @override
  String toString() {
    return "Product{id: $id, name: $name, description: $description, price: $price, imageUrl: $imagePath}";
  }
}
