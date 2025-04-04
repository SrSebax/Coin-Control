import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_widget.dart';
import '../widgets/action_button_widget.dart';
import '../widgets/transaction_item_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola 👋', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // Tarjetas de saldo, gastos y ahorros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardWidget(title: 'Saldo', emoji: '💰', amount: '\$1,500'),
                CardWidget(title: 'Gastos', emoji: '📉', amount: '\$750'),
                CardWidget(title: 'Ahorros', emoji: '🏦', amount: '\$500'),
              ],
            ),
            SizedBox(height: 30),

            // Botones de acciones rápidas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(icon: Icons.add_circle, label: 'Agregar Ingreso', color: Colors.green),
                ActionButton(icon: Icons.remove_circle, label: 'Agregar Gasto', color: Colors.red),
              ],
            ),
            SizedBox(height: 30),

            // Lista de movimientos recientes
            Text("Movimientos recientes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  TransactionItem(title: 'Compra en Supermercado', amount: '-\$50', color: Colors.red),
                  TransactionItem(title: 'Sueldo recibido', amount: '+\$1,200', color: Colors.green),
                  TransactionItem(title: 'Pago de Internet', amount: '-\$40', color: Colors.red),
                  TransactionItem(title: 'Ahorro mensual', amount: '-\$200', color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
