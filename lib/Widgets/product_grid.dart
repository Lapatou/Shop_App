import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/product.dart';
import 'package:shop_app/Providers/product_provider.dart';
import 'package:shop_app/Widgets/product_item.dart';

// ignore: use_key_in_widget_constructors
class ProductGrid extends StatelessWidget {
  bool showOnlyFavorites;

  ProductGrid(this.showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<Product> products = showOnlyFavorites
        ? productProvider.favoriteItems
        : productProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
