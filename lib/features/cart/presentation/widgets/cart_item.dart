import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import 'add_remove_widget.dart';
import 'cost_widget.dart';
import '../../../pharmacy/domain/entities/product.dart';

class CartItem extends StatefulWidget {
  final Product product;
  final Map<int, int> productsInCart;

  const CartItem({Key key, this.product, this.productsInCart})
      : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  CartBloc get bloc => BlocProvider.of<CartBloc>(context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  TextTheme get textTheme => Theme.of(context).textTheme;
  ColorScheme get colorScheme => Theme.of(context).colorScheme;


  @override
  Widget build(BuildContext context) {
    final cartItemHeight = height * 0.13;
    final cartItemWidth = width * 0.9;

    final sideMargin = (width - cartItemWidth) / 2;

    final imageWidth = cartItemWidth * 0.25;

    final int itemQuantity = widget.productsInCart[widget.product.id];
    final double _subtotal = itemQuantity * widget.product.price;
    print('$itemQuantity : $_subtotal');

    return Container(
      height: cartItemHeight,
      width: cartItemWidth,
      margin: EdgeInsets.all(sideMargin),
      child: Material(
        color: Colors.white,
        elevation: 20,
        shadowColor: colorScheme.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: imageWidth,
                child: Image.asset(widget.product.imageUrl),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              widget.product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.headline5.copyWith(
                                fontSize: 22,
                                color: colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          CostWidget(value: _subtotal),
                        ],
                      ),
                      Text(
                        widget.product.constituents,
                        style: textTheme.subtitle2.copyWith(
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(height: 10),
                      AddRemoveWidget(
                        productsInCart: widget.productsInCart,
                        product: widget.product,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
