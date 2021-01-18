import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../../../pharmacy/domain/entities/product.dart';

class AddRemoveWidget extends StatelessWidget {
  const AddRemoveWidget({
    Key key,
    @required this.productsInCart,
    @required this.product,
  }) : super(key: key);

  final Map<int, int> productsInCart;
  final Product product;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CartBloc>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final itemQuantity = productsInCart[product.id];

    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.remove_circle),
            color: colorScheme.secondaryVariant,
            iconSize: 30,
            onPressed: () => bloc.add(RemoveFromCartEvent(product)),
          ),
          Spacer(),
          Text(
            '$itemQuantity',
            style: textTheme.headline5.copyWith(
              fontSize: 24,
              color: Colors.black54,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add_circle),
            color: colorScheme.secondaryVariant,
            padding: EdgeInsets.zero,
            iconSize: 30,
            onPressed: () => bloc.add(AddToCartEvent(product)),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
