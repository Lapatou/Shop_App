import 'package:flutter/material.dart';
import 'package:shop_app/Widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magzaaa"),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favorites) {
                  _showOnlyFavorite = true;
                } else if (value == FilterOptions.all) {
                  _showOnlyFavorite = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text("Only Favorites")),
              const PopupMenuItem(
                  value: FilterOptions.all, child: Text("Show ALl")),
            ],
          )
        ],
        centerTitle: true,
      ),
      body: ProductGrid(_showOnlyFavorite),
    );
  }
}
