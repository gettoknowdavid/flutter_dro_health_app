import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/widgets/cart_item.dart';
import '../../domain/entities/product.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.only(top: 30),
      child: DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        // maxChildSize: 0.97,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
            child: Container(
              color: colorScheme.secondaryVariant,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    _TopBar(),
                    CartList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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

class _TopBar extends StatelessWidget {
  const _TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return mainContainer(
            height,
            colorScheme,
            textTheme,
            child: quantityValue(
              state.products.length,
              height,
              textTheme,
              colorScheme,
            ),
          );
        } else {
          return mainContainer(height, colorScheme, textTheme);
        }
      },
    );
  }

  Container mainContainer(
      double height, ColorScheme colorScheme, TextTheme textTheme,
      {Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      height: height * 0.1,
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_basket,
                color: colorScheme.primaryVariant,
                size: 40,
              ),
              SizedBox(width: 10),
              Text(
                'Bag',
                style: textTheme.headline5.copyWith(
                  color: colorScheme.primaryVariant,
                ),
              )
            ],
          ),
          Spacer(),
          child ?? Container(),
        ],
      ),
    );
  }

  Container quantityValue(
      int value, double height, TextTheme textTheme, ColorScheme colorScheme) {
    return Container(
      height: height * 0.05,
      width: height * 0.05,
      alignment: Alignment.center,
      child: AutoSizeText(
        value.toString(),
        minFontSize: 20,
        style: textTheme.headline5,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primaryVariant,
        shape: BoxShape.circle,
      ),
    );
  }
}
