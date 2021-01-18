// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as int,
    name: json['name'] as String,
    constituents: json['constituents'] as String,
    description: json['description'] as String,
    dispenseType:
        _$enumDecodeNullable(_$DispenseTypeEnumMap, json['dispenseType']),
    packSize: _$enumDecodeNullable(_$PackSizeEnumMap, json['packSize']),
    drugType: _$enumDecodeNullable(_$DrugTypeEnumMap, json['drugType']),
    producer: json['producer'] as String,
    producerLogoUrl: json['producerLogoUrl'] as String,
    price: (json['price'] as num)?.toDouble(),
    imageUrl: json['imageUrl'] as String,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'constituents': instance.constituents,
      'description': instance.description,
      'dispenseType': _$DispenseTypeEnumMap[instance.dispenseType],
      'packSize': _$PackSizeEnumMap[instance.packSize],
      'drugType': _$DrugTypeEnumMap[instance.drugType],
      'producer': instance.producer,
      'producerLogoUrl': instance.producerLogoUrl,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'weight': instance.weight,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DispenseTypeEnumMap = {
  DispenseType.all: 'all',
  DispenseType.pack: 'pack',
  DispenseType.container: 'container',
  DispenseType.bottle: 'bottle',
};

const _$PackSizeEnumMap = {
  PackSize.none: 'none',
  PackSize.s1x10: 's1x10',
  PackSize.s3x10: 's3x10',
  PackSize.s10x3: 's10x3',
  PackSize.s2x12: 's2x12',
  PackSize.s10x10: 's10x10',
};

const _$DrugTypeEnumMap = {
  DrugType.none: 'none',
  DrugType.oralSuspension: 'oralSuspension',
  DrugType.softGel: 'softGel',
  DrugType.tablet: 'tablet',
};
