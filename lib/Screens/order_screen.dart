import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart' show Orders;
import 'package:shop_app/Widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static const String routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final Orders ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Orders",
        ),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context, index) => OrderItem(
          order: ordersData.orders[index],
        ),
      ),
    );
  }
}
