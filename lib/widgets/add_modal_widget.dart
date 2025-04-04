import 'package:flutter/material.dart';
import 'income_form_widget.dart';
import 'category_form_widget.dart';

void showAddModal(BuildContext context, List<Map<String, String>> categories, Function(String, String) onCategoryAdded) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('¿Qué deseas agregar?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('Agregar Ingreso'),
              onTap: () {
                Navigator.pop(context);
                showIncomeForm(context, categories); // Ahora pasamos la lista de categorías
              },
            ),
            ListTile(
              leading: Icon(Icons.category, color: Colors.blue),
              title: Text('Agregar Categoría'),
              onTap: () {
                Navigator.pop(context);
                showCategoryForm(context, onCategoryAdded);
              },
            ),
          ],
        ),
      );
    },
  );
}
