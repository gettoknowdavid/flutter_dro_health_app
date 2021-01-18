import 'package:flutter/material.dart';
import 'features/pharmacy/presentation/pages/pharmacy_page.dart';
import 'theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PharmacyPage(),
      title: 'DRO Health',
      theme: AppTheme.theme,
    );
  }
}
