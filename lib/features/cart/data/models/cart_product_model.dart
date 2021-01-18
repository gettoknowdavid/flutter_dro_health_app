import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../pharmacy/data/models/product_model.dart';
import '../../domain/entities/cart_product.dart';

part 'cart_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartProductModel extends CartProduct {
  CartProductModel({
    @required List<ProductModel> products,
    @required Map<int, int> productsMap,
  }) : super(products: products, productsMap: productsMap);

  static CartProductModel fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
