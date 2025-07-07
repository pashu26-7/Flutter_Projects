class CartItem {
  final String title;
  final String image;
  final double price;
  final String description;
  final int quantity;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'quantity': quantity,
    };
  }
}
