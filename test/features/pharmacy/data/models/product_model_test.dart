import 'dart:convert';

import 'package:flutter_dro_health_app/core/constants/contanst.dart';
import 'package:flutter_dro_health_app/features/pharmacy/data/models/product_model.dart';
import 'package:flutter_dro_health_app/features/pharmacy/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should be a subclass of Product entity',
    () async {
      expect(tProductModel, isA<Product>());
    },
  );

  group('fromJson', () {
    test(
      'should return valid model when the JSON string is given',
      () async {
        final encodedString = json.encode(tProductModel.toJson());
        final Map<String, dynamic> jsonMap = json.decode(encodedString);

        final result = ProductModel.fromJson(jsonMap);

        expect(result, tProductModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing proper data',
      () async {
        final result = tProductModel.toJson();

        final str = json.encode(tProductModel.toJson());
        final Map<String, dynamic> expectedMap = json.decode(str);

        expect(result, expectedMap);
      },
    );
  });
}
