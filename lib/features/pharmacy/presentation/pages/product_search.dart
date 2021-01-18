import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/custom_back_button.dart';

class ProductSearch extends SearchDelegate<Product> {
  final Bloc<SearchEvent, SearchState> searchBloc;

  ProductSearch(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) => null;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: CustomBackButton(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(SearchEvent(query: query));

    return BlocBuilder<SearchBloc, SearchState>(
      cubit: searchBloc,
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return Center(
            child: Text('Error'),
          );
        }
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.mediation_sharp),
              title: Text(state.products[i].name),
              onTap: () {
                close(context, state.products[i]);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
