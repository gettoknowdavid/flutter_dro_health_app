import 'package:equatable/equatable.dart';
import '../../../../core/utils/uuid.dart';
import '../../../../core/constants/dispensation_type_enum.dart';
import '../../../../core/constants/drug_type_enum.dart';
import '../../../../core/constants/pack_size_enum.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String constituents;
  final String description;
  final DispenseType dispenseType;
  final PackSize packSize;
  final DrugType drugType;
  final String producer;
  final String producerLogoUrl;
  final double price;
  final String imageUrl;
  final int weight;

  Product({
    int id,
    this.name,
    this.constituents,
    this.description,
    this.dispenseType,
    this.packSize,
    this.drugType,
    this.producer,
    this.producerLogoUrl,
    this.price,
    this.imageUrl,
    this.weight,
  }) : id = id ?? AppUuid.v4();

  @override
  List<Object> get props => [
        id,
        name,
        constituents,
        description,
        dispenseType,
        packSize,
        drugType,
        producer,
        producerLogoUrl,
        price,
        imageUrl,
        weight,
      ];

  // static Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  // Map<String, dynamic> toJson() => _$ProductToJson(this);
}
