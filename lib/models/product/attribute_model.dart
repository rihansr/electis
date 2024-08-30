import 'package:hive/hive.dart';
import 'attribute_option_model.dart';
part 'attribute_model.g.dart';

@HiveType(typeId: 2)
class Attribute {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? slug;
  @HiveField(2)
  final List<AttributeOption> options;

  const Attribute({
    this.name,
    this.slug,
    this.options = const [],
  });

  Attribute copyWith({
    String? name,
    String? slug,
    List<AttributeOption>? options,
  }) {
    return Attribute(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      options: options ?? this.options,
    );
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      name: map['name'],
      slug: map['slug'],
      options: List<AttributeOption>.from(
        map['options']?.map((x) => AttributeOption.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'slug': slug,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Attribute && other.slug == slug;
  }

  @override
  int get hashCode {
    return slug.hashCode;
  }
}
