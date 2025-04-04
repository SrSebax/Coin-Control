import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2)], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        children: [
          ClipOval(
            child: Image.asset('assets/coin-control.png', width: 45, height: 45, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Text('CoinControl',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('¿Salir de CoinControl?'),
                content: Text('¿Estás seguro de que quieres cerrar sesión?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), 
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text('Salir', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.logout, color: Colors.white),
          label: Text('Salir', style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
        SizedBox(width: 10),
      ],
    ),
  );
}
