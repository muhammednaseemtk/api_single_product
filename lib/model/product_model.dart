class ProductModel {
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final String? thumbnail;

  ProductModel({
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.thumbnail
  });

  factory ProductModel.fromJson(Map<String,dynamic> json) {
    return ProductModel(
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price']as num).toDouble(),
      discountPercentage: (json['discountPercentage']as num).toDouble(),
      rating: (json['rating']as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'],
      sku: json['sku'],
      thumbnail: json['thumbnail']
    );
  }
}