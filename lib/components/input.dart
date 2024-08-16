import 'package:flutter/material.dart';
import 'package:todo_list/Colors/colors.dart';

class Input extends StatelessWidget {
  final TextEditingController inputFieldController;
  final Icon icon;
  final VoidCallback onPressed;

  const Input({
    required this.inputFieldController,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: inputFieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Crie uma nova tarefa.',
                hintStyle: TextStyle(
                  color: DefaultTheme.gray300,
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: DefaultTheme.blueDark, // Ajuste a cor do botão
            ),
            child: Center(
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
