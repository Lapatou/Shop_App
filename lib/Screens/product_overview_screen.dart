import 'package:flutter/material.dart';
import 'package:shop_app/Widgets/product_grid.dart';

// ignore: use_key_in_widget_constructors
class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magzaaa"),
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}
