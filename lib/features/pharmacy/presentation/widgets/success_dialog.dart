import 'package:flutter/material.dart';
import '../../../cart/presentation/pages/cart_screen.dart';
import '../../domain/entities/product.dart';
import 'fade_page_route.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return Container(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.white,
            height: height * 0.3,
            width: width * 0.7,
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${product.name} has been added to your bag',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: theme.accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      FadePageRoute(
                        child: CartScreen(),
                      ),
                    );
                  },
                  child: Text('View Bag'),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: theme.accentColor,
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context),
                  child: Text('Done'),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -40,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.check_circle,
                size: 90,
                color: theme.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
