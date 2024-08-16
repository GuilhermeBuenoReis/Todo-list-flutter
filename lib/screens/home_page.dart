import 'package:flutter/material.dart';
import 'package:todo_list/Colors/colors.dart'; // Certifique-se de que esta importação está correta
import 'package:todo_list/components/header.dart';
import 'package:todo_list/components/input.dart';
import 'package:todo_list/models/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  List<Tasks> tasks = [
    Tasks(
      id: '1',
      name: ['Arrumar a casa'],
      isCompleted: false,
    ),
    Tasks(
      id: '2',
      name: ['Treinar'],
      isCompleted: true,
    ),
    Tasks(
      id: '3',
      name: ['Comprar caixinhas'],
      isCompleted: true,
    ),
  ];

  void addTask(String name) {
    setState(() {
      tasks.add(
        Tasks(
          id: DateTime.now().toString(),
          name: [name],
          isCompleted: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: DefaultTheme.gray600,
        child: Column(
          children: [
            const Header(
              imageUrl: 'assets/logo.png',
            ),
            Input(
              inputFieldController: _controller,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  addTask(_controller.text);
                  _controller.clear();
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 0.0),
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: DefaultTheme.gray500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        title: Text(
                          tasks[i].name.join(', '),
                          style: const TextStyle(
                            color: DefaultTheme.gray100,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: IconButton(
                          icon: Icon(
                            tasks[i].isCompleted
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: tasks[i].isCompleted
                                ? DefaultTheme.purpleDark
                                : DefaultTheme.blueDark,
                          ),
                          onPressed: () {
                            setState(() {
                              tasks[i].isCompleted = !tasks[i].isCompleted;
                            });
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(i);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
