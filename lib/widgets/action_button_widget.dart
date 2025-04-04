import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap; // Agregar esta línea

  ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap, // Agregar esto al constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Aquí lo usamos
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
