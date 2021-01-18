import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import 'cart_item.dart';
import '../../../pharmacy/domain/entities/product.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children(
        List<Product> products, Map<int, int> productsInCart) {
      return productsInCart.keys.map((int id) {
        Product product = products.firstWhere((p) => p.id == id);

        return CartItem(product: product, productsInCart: productsInCart);
      }).toList();
    }

    return Container(
      child: BlocBuilder<CartBloc, CartState>(
        cubit: context.watch<CartBloc>(),
        builder: (context, state) {
          if (state is CartLoaded) {
            return ListView(
              primary: false,
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: children(
                    state.products,
                    state.productsMap,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('EMPTY'),
            );
          }
        },
      ),
    );
  }
}

