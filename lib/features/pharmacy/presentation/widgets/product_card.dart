import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entities/product.dart';
import '../pages/details_page.dart';
import 'fade_page_route.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    final borderRadius = BorderRadius.circular(26);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              FadePageRoute(child: DetailsPage(product: product)),
            );
          },
          child: Material(
            color: Colors.white,
            elevation: 14,
            shadowColor: colorScheme.secondaryVariant.withOpacity(0.16),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: _ProductImage(product: product)),
                      AspectRatio(
                        aspectRatio: 4 / 2.7,
                        child: _ProductDetails(product: product),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: _ProductPrice(product: product),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.085,
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryVariant,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(26),
                          bottomLeft: Radius.circular(26),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<CartBloc>().add(AddToCartEvent(product));
                        },
                        splashRadius: 25,
                        color: colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: height * 0.15,
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: textTheme.headline6,
          ),
          Text(
            product.name,
            style: textTheme.subtitle1,
          ),
          Text(
            '${product.constituents} - ${product.weight}mg',
            style: textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}

class _ProductPrice extends StatelessWidget {
  const _ProductPrice({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final NumberFormat formatter = NumberFormat.currency(
      symbol: '\u20A6',
      decimalDigits: 2,
    );

    return Container(
      height: height * 0.03,
      width: width * 0.2,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0XFF909090),
        borderRadius: BorderRadius.circular(100),
      ),
      child: AutoSizeText(
        formatter.format(product.price),
        minFontSize: 13,
        style: TextStyle(
          letterSpacing: 1.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Hero(
        tag: '${product.id}__tag',
        child: Image.asset(product.imageUrl),
      ),
    );
  }
}
