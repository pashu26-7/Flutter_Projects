
class Fruit {
  final String name;
  final String imageUrl;
  final String price;
  final String description;

  Fruit({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  // Factory constructor to create a Fruit object from a map (useful when fetching data)
  factory Fruit.fromMap(Map<String, String> map) {
    return Fruit(
      name: map['name']!,
      imageUrl: map['imageUrl']!,
      price: map['price']!,
      description: map['description']!,
    );
  }
}
