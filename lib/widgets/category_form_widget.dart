import 'package:flutter/material.dart';

void showCategoryForm(BuildContext context, Function(String, String) onCategoryAdded) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => CategoryForm(onCategoryAdded: onCategoryAdded),
  );
}

class CategoryForm extends StatefulWidget {
  final Function(String, String) onCategoryAdded;

  CategoryForm({required this.onCategoryAdded});

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final TextEditingController titleController = TextEditingController();
  String selectedEmoji = '📌'; // Emoji por defecto

  final List<String> emojiOptions = [
    '📌', '🍔', '🚗', '🏠', '📚', '💼', '🎉', '🛒', '💡', '🏥',
    '🛠', '🎮', '📱', '🖥', '🎓', '🚌', '✈️', '🍿', '🎶', '🐾', '⚽'
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20, // Espacio extra por el teclado
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título con línea decorativa
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Agregar Categoría',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 60,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Campo de texto para el nombre de la categoría
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la categoría',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),

                // Selector de emoji
                Text('Selecciona un icono:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, // 6 emojis por fila
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: emojiOptions.length,
                  itemBuilder: (context, index) {
                    String emoji = emojiOptions[index];
                    bool isSelected = emoji == selectedEmoji;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedEmoji = emoji;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
                        ),
                        child: Center(
                          child: Text(emoji, style: TextStyle(fontSize: 28)),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Botón de agregar categoría
                // Botón de agregar categoría
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14),
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onPressed: () {
      if (titleController.text.isNotEmpty) {
        String title = titleController.text.trim();
        if (title.isNotEmpty) {
          // Capitalizar la primera letra y mantener el resto igual
          title = title[0].toUpperCase() + title.substring(1);
          widget.onCategoryAdded(title, selectedEmoji);
          Navigator.pop(context);
        }
      }
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.save, color: Colors.white),
        SizedBox(width: 8),
        Text(
          'Guardar Categoría',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ),
  ),
),

                SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
