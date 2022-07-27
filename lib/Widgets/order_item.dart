import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/Providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final ord.OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(
              DateFormat("dd MM yyy hh:mm").format(order.dateTime),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.expand_more,
                )),
          )
        ],
      ),
    );
  }
}
