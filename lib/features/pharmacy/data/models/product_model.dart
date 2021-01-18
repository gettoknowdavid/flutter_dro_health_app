import '../../../../core/constants/dispensation_type_enum.dart';
import '../../../../core/constants/drug_type_enum.dart';
import '../../../../core/constants/pack_size_enum.dart';
import '../../domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Product {
  ProductModel({
    @required int id,
    @required String name,
    @required String constituents,
    @required String description,
    @required DispenseType dispenseType,
    @required PackSize packSize,
    @required DrugType drugType,
    @required String producer,
    @required String producerLogoUrl,
    @required double price,
    @required String imageUrl,
    @required int weight,
  }) : super(
          id: id,
          name: name,
          constituents: constituents,
          description: description,
          dispenseType: dispenseType,
          packSize: packSize,
          drugType: drugType,
          producer: producer,
          producerLogoUrl: producerLogoUrl,
          price: price,
          imageUrl: imageUrl,
          weight: weight,
        );

  static ProductModel fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
