// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductListResponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductListResponseAdapter extends TypeAdapter<ProductListResponse> {
  @override
  final int typeId = 0;

  @override
  ProductListResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductListResponse(
      status: fields[0] as bool?,
      message: fields[1] as String?,
      data: (fields[2] as List?)?.cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductListResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
