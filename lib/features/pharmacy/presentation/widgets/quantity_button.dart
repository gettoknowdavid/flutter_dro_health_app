import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entities/product.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      child: Row(
        children: [
          Container(
            height: height * 0.058,
            width: width * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: const Color(0xFF909090),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    iconSize: 28,
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveFromCartEvent(product));
                    },
                  ),
                ),
                Container(
                  height: height * 0.058,
                  width: (width * 0.32) * 0.35,
                  alignment: Alignment.center,
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        final int itemQuantity = state.productsMap[product.id];

                        return AutoSizeText(
                          itemQuantity == null ? '0' : itemQuantity.toString() ,
                          minFontSize: 18,
                          style: textTheme.headline4.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      } else {
                        return AutoSizeText(
                          '0',
                          minFontSize: 18,
                          style: textTheme.headline4.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 28,
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCartEvent(product));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Pack(s)',
            style: textTheme.headline6.copyWith(
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
