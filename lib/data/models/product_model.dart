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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'path': path,
        'price': price,
        'oldPrice': oldPrice,
        'category': category,
        'color': color,
        'sizes': sizes,
        'description': description,
        'isNew': isNew,
        'isFavorite': isFavorite,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        path: json['path'] as String? ?? '',
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        oldPrice: (json['oldPrice'] as num?)?.toDouble(),
        category: json['category'] as String? ?? '',
        color: json['color'] as String? ?? '',
        sizes: (json['sizes'] as List?)?.map((e) => e.toString()).toList() ?? const [],
        description: json['description'] as String? ?? '',
        isNew: json['isNew'] as bool? ?? false,
        isFavorite: json['isFavorite'] as bool? ?? false,
      );
}
