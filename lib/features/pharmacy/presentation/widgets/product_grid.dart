import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key key, @required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 50.0),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.0,
        mainAxisSpacing: 30.0,
        childAspectRatio: 3 / 5,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return ProductCard(product: products[i]);
      },
    );
  }
}
