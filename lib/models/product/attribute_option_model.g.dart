// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_option_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributeOptionAdapter extends TypeAdapter<AttributeOption> {
  @override
  final int typeId = 3;

  @override
  AttributeOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttributeOption(
      name: fields[0] as String?,
      slug: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AttributeOption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributeOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
