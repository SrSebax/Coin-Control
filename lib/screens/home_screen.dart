import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_widget.dart';
import '../widgets/action_button_widget.dart';
import '../widgets/transaction_item_widget.dart';
import '../widgets/add_modal_widget.dart';
import '../widgets/delete_modal_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista inicial de categorías con saldo, gastos y ahorros
  List<Map<String, String>> categories = [
    {'title': 'Saldo', 'emoji': '💰', 'amount': '\$1,500'},
    {'title': 'Gastos', 'emoji': '📉', 'amount': '\$750'},
    {'title': 'Ahorros', 'emoji': '🏦', 'amount': '\$500'},
  ];

  // Función para agregar una nueva categoría
  void addCategory(String title, String emoji) {
    setState(() {
      categories.add({'title': title, 'emoji': emoji, 'amount': '\$0'});
    });
  }

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

            // Tarjetas de categorías (incluyendo las nuevas categorías agregadas)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CardWidget(
                      title: category['title']!,
                      emoji: category['emoji']!,
                      amount: category['amount']!,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30),

            // Botones de acciones rápidas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.add_circle,
                  label: 'Agregar',
                  color: Colors.green,
                  onTap: () => showAddModal(context, categories, addCategory), // Pasamos la función
                ),
                ActionButton(
                  icon: Icons.remove_circle,
                  label: 'Eliminar',
                  color: Colors.red,
                  onTap: () => showDeleteModal(context),
                ),
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
