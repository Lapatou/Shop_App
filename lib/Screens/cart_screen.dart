import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart' show Cart;
import 'package:shop_app/Providers/orders.dart';
import 'package:shop_app/Widgets/app_drawer.dart';
import 'package:shop_app/Widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      persistentFooterButtons: [
        TextButton(
            onPressed: () {
              Provider.of<Orders>(context, listen: false).addOrder(
                cart.items.values.toList(),
                cart.totalAmound,
              );
              cart.clear();
              //Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Order Now",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ))
      ],
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      "\$" + cart.totalAmound.toStringAsFixed(2),
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline1
                              ?.color),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => CartItem(
                id: cart.items.values.toList()[index].id,
                productId: cart.items.keys.toList()[index],
                title: cart.items.values.toList()[index].title,
                quantity: cart.items.values.toList()[index].quantity,
                price: cart.items.values.toList()[index].price),
          ))
        ],
      ),
    );
  }
}
