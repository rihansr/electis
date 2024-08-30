import 'package:hive/hive.dart';
part 'attribute_option_model.g.dart';

@HiveType(typeId: 3)
class AttributeOption {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? slug;

  const AttributeOption({
    this.name,
    this.slug,
  });

  AttributeOption copyWith({
    String? name,
    String? slug,
  }) {
    return AttributeOption(
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  factory AttributeOption.fromMap(Map<String, dynamic> map) {
    return AttributeOption(
      name: map['name'],
      slug: map['slug'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'slug': slug,
    };
  }
  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AttributeOption && other.slug == slug;
  }

  @override
  int get hashCode {
    return slug.hashCode;
  }
}
