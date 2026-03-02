class ProductsResponseModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductsResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'] as List? ?? [];
    return ProductsResponseModel(
      products: rawProducts.map((e) {
        try {
          return ProductModel.fromJson(Map<String, dynamic>.from(e));
        } catch (_) {
          return ProductModel.fallback();
        }
      }).toList(),
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}

class ProductModel {
  final int id;
  final String title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? thumbnail;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] is int ? json['id'] : (json['id'] as num).toInt(),
      title: json['title']?.toString() ?? 'Produto sem título',
      description: json['description']?.toString(),
      category: json['category']?.toString(),
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      discountPercentage: json['discountPercentage'] != null
          ? (json['discountPercentage'] as num).toDouble()
          : null,
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      stock: json['stock'] is int ? json['stock'] : (json['stock'] as num?)?.toInt(),
      brand: json['brand']?.toString(),
      thumbnail: json['thumbnail']?.toString(),
      images: (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  ProductModel.fallback()
      : id = 0,
        title = 'Produto inválido',
        description = null,
        category = null,
        price = null,
        discountPercentage = null,
        rating = null,
        stock = null,
        brand = null,
        thumbnail = null,
        images = [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'thumbnail': thumbnail,
        'images': images,
      };
}