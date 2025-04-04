import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  TransactionItem({required this.title, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.swap_vert, color: color),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
