import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int quantity;
  final double price;

  const CartItem({
    Key? key,
    required this.id,
    required this.quantity,
    required this.price,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text("\$$price"),
            ),
          )),
          title: Text(title),
          subtitle: Text("\$${price * quantity}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
