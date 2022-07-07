import 'package:flutter/material.dart';
import 'package:shop_app/Screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent,
        ),
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
    );
  }
}
