import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entities/product.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/other_details_widget.dart';
import '../widgets/quantity_button.dart';
import '../widgets/success_dialog.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(color: Colors.white),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProductImage(product: product),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: textTheme.headline4),
                      Text(
                        '${product.constituents} - ${product.weight}mg',
                        style: textTheme.headline5,
                      ),
                      SizedBox(height: 20),
                      _ProducerDetails(product: product),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          QuantityButton(product: product),
                          Spacer(),
                          _PriceWidget(product: product),
                        ],
                      ),
                      SizedBox(height: 30),
                      OtherDetailsWidget(product: product),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: _AddToBagButton(onPressed: () {
                context.read<CartBloc>().add(AddToCartEvent(product));
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SuccessDialog(product: product);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final imageHeight = height * 0.3;
    return Container(
      height: imageHeight,
      width: width,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Hero(
          tag: '${product.id}__tag',
          child: Image.asset(product.imageUrl),
        ),
      ),
    );
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('\u20A6', style: textTheme.headline6),
        SizedBox(width: 6),
        BlocBuilder<CartBloc, CartState>(
          cubit: context.watch<CartBloc>(),
          builder: (context, state) {
            if (state is CartLoaded) {
              final int itemQuantity = state.productsMap[product.id] ?? 0;
              final _subtotal = itemQuantity * product.price;

              return Text(
                '$_subtotal',
                style: textTheme.headline4,
              );
            } else {
              return Text(
                '0.0',
                style: textTheme.headline4,
              );
            }
          },
        ),
      ],
    );
  }
}

class _AddToBagButton extends StatelessWidget {
  const _AddToBagButton({Key key, @required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return MaterialButton(
      minWidth: width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 16),
      color: colorScheme.secondary,
      onPressed: onPressed,
      child: Text('Add to bag'),
    );
  }
}

class _ProducerDetails extends StatelessWidget {
  const _ProducerDetails({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Container(
      width: width,
      alignment: Alignment.center,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: CircleAvatar(
              radius: size.shortestSide * 0.07,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage(product.producerLogoUrl),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SOLD BY', style: textTheme.caption),
              Text(
                product.producer,
                style: textTheme.headline6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
