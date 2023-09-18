import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tareas_2023/Tarea4/controllers/password_provider.dart';
import 'package:tareas_2023/Tarea4/views/form_password_generator.dart';

class HomePasswordGenerator extends StatefulWidget {
  const HomePasswordGenerator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePasswordGenerator();
  }
}

class _HomePasswordGenerator extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GENERADOR DE CONTRASEÑAS"),
        backgroundColor: const Color.fromARGB(255, 145, 123, 255),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PasswordProvider(),
        child: FormPasswordGenerator(),
      ),
    );
  }
}
