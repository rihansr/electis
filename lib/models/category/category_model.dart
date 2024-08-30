import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 4)
class Category {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;

  const Category({
    this.id,
    this.name,
    this.slug,
  });

  Category copyWith({
    int? id,
    String? name,
    String? slug,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
