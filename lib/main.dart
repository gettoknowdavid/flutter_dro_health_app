import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/pharmacy/presentation/bloc/pharmacy_bloc.dart';
import 'features/pharmacy/presentation/bloc/search_bloc/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<PharmacyBloc>()..add(GetProductsEvent()),
          ),
          BlocProvider(
            create: (context) => sl<SearchBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<CartBloc>()..add(LoadCartEvent()),
          ),

        ],
        child: App(),
      ),
  );
}
