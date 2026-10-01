class ProductModel {
  final int id;
  final String name;
  final String path;
  final double price;
  final double? oldPrice;
  final String category;
  final String color;
  final List<String> sizes;
  final String description;
  final bool isNew;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.path,
    required this.price,
    this.oldPrice,
    required this.category,
    required this.color,
    required this.sizes,
    required this.description,
    this.isNew = false,
    this.isFavorite = false,
  });
}
