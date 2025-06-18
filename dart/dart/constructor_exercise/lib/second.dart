class Product {
  const Product(this.name, this.price, this.createdAt);

  Product.withoutTimestamp(this.name, this.price) : createdAt = DateTime.now();

  Product.freeSample(String name) : this.withoutTimestamp(name, 0.0);

  const factory Product.sample(String name, double price, DateTime createdAt) =
      Product;

  final String name;
  final double price;
  final DateTime createdAt;

  /*
  Product(name: "X", price: $Y, createdAt: Z)
   */
  @override
  String toString() {
    return 'Product(name: "$name", price: \$$price, createdAt: $createdAt)';
  }
}
