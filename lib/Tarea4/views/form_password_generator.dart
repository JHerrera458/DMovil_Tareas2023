import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tareas_2023/Tarea4/controllers/password_provider.dart';

class FormPasswordGenerator extends StatefulWidget {
  const FormPasswordGenerator({super.key});

  @override
  State<FormPasswordGenerator> createState() => _FormPasswordGeneratorState();
}

class _FormPasswordGeneratorState extends State<FormPasswordGenerator> {
  @override
  Widget build(BuildContext context) {
    PasswordProvider passwordProvider = Provider.of<PasswordProvider>(context);
    return Form(
      key: passwordProvider.keyFormPassword,
      child: createForm(passwordProvider),
    );
  }

  createForm(PasswordProvider passwordProvider) {
    return ListView(
      children: [
        createPasswordRow(passwordProvider),
        createCustomizePassword(passwordProvider),
      ],
    );
  }

  createPasswordRow(PasswordProvider passwordProvider) {
    return Container(
      margin:
          const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15 / 2),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: const Color.fromARGB(255, 209, 200, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 145, 123, 255),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(passwordProvider.generatedPassword),
          Row(
            children: [
              // Icono para generar nueva contraseña.
              IconButton(
                onPressed: () {
                  passwordProvider.generatedPassword =
                      passwordProvider.generateRandomPassword();
                  setState(() {});
                },
                icon: const Icon(Icons.replay_rounded),
              ),

              // Icono para copiar contraseña
              IconButton(
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: passwordProvider.generatedPassword));
                  showCopyDialog();
                },
                icon: const Icon(Icons.copy),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showCopyDialog() {
    const snackBar = SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 145, 123, 255),
      content: Text('Contraseña copiada'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  createCustomizePassword(PasswordProvider passwordProvider) {
    const divider = Divider(color: Color.fromARGB(70, 0, 0, 0), thickness: 1);
    return Container(
      margin:
          const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15 / 2),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: const Color.fromARGB(255, 209, 200, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 145, 123, 255),
        ),
      ),
      child: Column(
        children: [
          const Text("PERSONALIZA TU CONTRASEÑA",
              style: TextStyle(fontWeight: FontWeight.w800)),
          divider,
          createSlider(passwordProvider),
          divider,
          createPasswordOptions(passwordProvider),
          divider,
        ],
      ),
    );
  }

  createPasswordOptions(PasswordProvider passwordProvider) {
    return Column(
      children: [
        CheckboxListTile(
          value: passwordProvider.useUppercase,
          onChanged: (newValue) {
            passwordProvider.useUppercase = !passwordProvider.useUppercase;
            passwordProvider.generatedPassword =
                passwordProvider.generateRandomPassword();
            setState(() {});
          },
          title: const Text("Mayúsuclas"),
        ),
        CheckboxListTile(
          value: passwordProvider.useLowercase,
          onChanged: (newValue) {
            passwordProvider.useLowercase = !passwordProvider.useLowercase;
            passwordProvider.generatedPassword =
                passwordProvider.generateRandomPassword();
            setState(() {});
          },
          title: const Text("Minúsculas"),
        ),
        CheckboxListTile(
          value: passwordProvider.useSymbols,
          onChanged: (newValue) {
            passwordProvider.useSymbols = !passwordProvider.useSymbols;
            passwordProvider.generatedPassword =
                passwordProvider.generateRandomPassword();
            setState(() {});
          },
          title: const Text("Símbolos"),
        ),
        CheckboxListTile(
          value: passwordProvider.useNumbers,
          onChanged: (newValue) {
            passwordProvider.useNumbers = !passwordProvider.useNumbers;
            passwordProvider.generatedPassword =
                passwordProvider.generateRandomPassword();
            setState(() {});
          },
          title: const Text("Números"),
        ),
      ],
    );
  }

  createSlider(PasswordProvider passwordProvider) {
    return Column(
      children: [
        Text("Longitud de la contraseña: ${passwordProvider.length}"),
        Slider(
            min: 1,
            max: 50,
            divisions: 49,
            value: passwordProvider.length,
            onChanged: (double newValue) {
              setState(() {
                passwordProvider.length = newValue.roundToDouble();
                passwordProvider.generatedPassword =
                    passwordProvider.generateRandomPassword();
              });
            }),
      ],
    );
  }
}
