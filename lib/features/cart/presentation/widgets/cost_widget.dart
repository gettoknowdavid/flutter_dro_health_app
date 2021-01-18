import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CostWidget extends StatelessWidget {
  const CostWidget(
      {Key key,
      @required this.value,
      this.fontSize: 21,
      this.fontWeight: FontWeight.w400,
      this.color,
      this.mainAxisAlignment: MainAxisAlignment.start})
      : super(key: key);

  final double value;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final textTheme = Theme.of(context).textTheme;

    final NumberFormat formatter = NumberFormat.currency(
      symbol: '\u20A6',
      decimalDigits: 2,
    );

    final _value = formatter.format(value).split('\u20A6')[1];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        Text(
          '\u20A6 ',
          style: TextStyle(
            color: Colors.black45,
            fontSize: fontSize * 0.7,
          ),
        ),
        Text(
          _value,
          style: textTheme.headline6.copyWith(
            color: color ?? Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
