import 'package:flutter/material.dart';

void showDeleteModal(BuildContext context) {
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
            Text('Eliminar elementos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Eliminar una transacción'),
              onTap: () {
                Navigator.pop(context);
                // Aquí podrías abrir otro modal para seleccionar qué eliminar
              },
            ),
          ],
        ),
      );
    },
  );
}
