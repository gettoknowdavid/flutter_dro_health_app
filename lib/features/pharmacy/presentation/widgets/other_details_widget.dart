import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/images.dart';
import '../../domain/entities/product.dart';

class OtherDetailsWidget extends StatelessWidget {
  const OtherDetailsWidget({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'PRODUCT DETAILS',
          style: textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF909090),
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 14,
          runSpacing: 30,
          alignment: WrapAlignment.start,
          children: [
            _OtherDetailsWidgetItem(
              image: PharmacyImage.pills,
              title: 'PACK SIZE',
              subtitle: '3x10',
            ),
            _OtherDetailsWidgetItem(
              image: PharmacyImage.pill,
              title: 'CONSTITUENTS',
              subtitle: product.constituents,
            ),
            _OtherDetailsWidgetItem(
              image: PharmacyImage.drugBottle,
              title: 'DISPENSED IN',
              subtitle: 'Packs',
            ),
            _OtherDetailsWidgetItem(
              image: PharmacyImage.qrCode,
              title: 'PRODUCT ID',
              subtitle: 'PYUIG6XDH',
            ),
          ],
        ),
        SizedBox(height: 40),
        Text(
          '1 pack of ${product.name} contains 3 unit(s) of 10 tablet(s)',
          style: textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _OtherDetailsWidgetItem extends StatelessWidget {
  const _OtherDetailsWidgetItem({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: size.shortestSide * 0.085,
      width: size.width * 0.44,
      child: Row(
        children: [
          Container(
            width: size.shortestSide * 0.07,
            padding: EdgeInsets.all(2),
            child: Image(
              image: image,
              color: colorScheme.secondaryVariant,
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textTheme.caption,
              ),
              AutoSizeText(
                subtitle,
                minFontSize: 16,
                style: textTheme.subtitle1.copyWith(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
