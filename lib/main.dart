import 'package:flutter/material.dart';
import 'package:tareas_2023/Tarea4/home_passwords.dart';

void main() {
  runApp(AppBases());
}

class AppBases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createScaffold(),
      routes: {
        "tarea4": (context) => HomePasswordGenerator(),
      },
    );
  }
}

createScaffold() {
  List examples = [
    {"name": "Tarea 4: Generador de contraseñas", "route": "tarea4"},
  ];

  return Scaffold(
    appBar: AppBar(
        title: const Text("Lista de Apps 2023-2"),
        backgroundColor: const Color.fromARGB(255, 145, 123, 255)),
    body: ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(examples[index]["name"]),
          onTap: () {
            routing(context, examples[index]["route"]);
          },
        );
      },
      itemCount: examples.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
      ),
    ),
  );
}

void routing(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}
