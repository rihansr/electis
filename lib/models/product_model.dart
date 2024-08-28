import 'package:hive/hive.dart';
import 'category_model.dart';
part 'product_model.g.dart';

@HiveType(typeId: 5)
class Product {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final num rating;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final bool isNew;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final bool topDeals;
  @HiveField(8)
  final List<Category> categories;

  const Product({
    this.id,
    this.name = '',
    this.image,
    this.rating = 0.0,
    this.price = 0.0,
    this.isNew = false,
    this.isPopular = false,
    this.topDeals = false,
    this.categories = const [],
  });

  Product copyWith({
    int? id,
    String? name,
    String? image,
    num? rating,
    num? price,
    bool? isNew,
    bool? isPopular,
    bool? topDeals,
    List<Category>? categories,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isNew: isNew ?? this.isNew,
      isPopular: isPopular ?? this.isPopular,
      topDeals: topDeals ?? this.topDeals,
      categories: categories ?? this.categories,
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'] ?? '',
      image: map['image'],
      rating: map['rating'] ?? 0.0,
      price: map['price'] ?? 0.0,
      isNew: map['is_new'] ?? false,
      isPopular: map['is_popular'] ?? false,
      topDeals: map['top_deals'] ?? false,
      categories: List<Category>.from(
        map['categories']?.map((x) => Category.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'price': price,
      'is_new': isNew,
      'is_popular': isPopular,
      'top_deals': topDeals,
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, rating: $rating, price: $price, isNew: $isNew, isPopular: $isPopular, topDeals: $topDeals, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
