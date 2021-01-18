import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../bloc/pharmacy_bloc.dart';
import '../bloc/search_bloc/search_bloc.dart';
import 'details_page.dart';
import 'product_search.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/fade_page_route.dart';
import '../widgets/product_grid.dart';

class PharmacyPage extends StatefulWidget {
  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DRO Health'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 26,
            onPressed: () async {
              Product selectedProduct = await showSearch<Product>(
                context: context,
                delegate: ProductSearch(
                  BlocProvider.of<SearchBloc>(context),
                ),
              );
              selectedProduct == null
                  ? Navigator.pushReplacement(
                      context,
                      FadePageRoute(child: PharmacyPage()),
                    )
                  : Navigator.push(
                      context,
                      FadePageRoute(
                        child: DetailsPage(product: selectedProduct),
                      ),
                    );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder<PharmacyBloc, PharmacyState>(
            cubit: context.watch<PharmacyBloc>(),
            builder: (context, state) {
              if (state is PharmacyLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ProductGrid(products: state.products),
                    ),
                  ],
                );
              } else if (state is PharmacyEmpty) {
                return Center(
                  child: Text('EMPTY'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          CustomBottomSheet(),
        ],
      ),
    );
  }
}

