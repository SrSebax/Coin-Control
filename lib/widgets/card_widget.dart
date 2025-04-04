import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String emoji;
  final String amount;

  CardWidget({required this.title, required this.emoji, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(emoji, style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(amount, style: TextStyle(fontSize: 18, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
