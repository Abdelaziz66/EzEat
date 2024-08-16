// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEntityAdapter extends TypeAdapter<FoodEntity> {
  @override
  final int typeId = 0;

  @override
  FoodEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEntity(
      id: fields[0] as String?,
      title: fields[1] as String?,
      subTitle: fields[2] as String?,
      price: fields[3] as num?,
      protein: fields[4] as String?,
      carb: fields[5] as String?,
      fat: fields[6] as String?,
      imageUrl: fields[7] as String?,
    )
      ..favourite = fields[8] as bool
      ..cart = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, FoodEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subTitle)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.carb)
      ..writeByte(6)
      ..write(obj.fat)
      ..writeByte(7)
      ..write(obj.imageUrl)
      ..writeByte(8)
      ..write(obj.favourite)
      ..writeByte(9)
      ..write(obj.cart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
