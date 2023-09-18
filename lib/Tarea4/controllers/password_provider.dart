import 'dart:math';
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  GlobalKey keyFormPassword = GlobalKey();

  String generatedPassword = "";
  double length = 1;
  bool useUppercase = true;
  bool useLowercase = true;
  bool useSymbols = true;
  bool useNumbers = true;

  String generateRandomPassword() {
    if (length <= 0) {
      throw ArgumentError('La longitud de la contraseña debe ser mayor que 0.');
    }
    final random = Random();
    const uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const symbolChars = '!@#\$%^&*()-_=+[]{}|;:<>,.?';
    const numberChars = '0123456789';

    final List<String> charSets = [];

    if (useUppercase) {
      charSets.add(uppercaseChars);
    }

    if (useLowercase) {
      charSets.add(lowercaseChars);
    }

    if (useSymbols) {
      charSets.add(symbolChars);
    }

    if (useNumbers) {
      charSets.add(numberChars);
    }

    if (charSets.isEmpty) {
      throw ArgumentError(
          'Debes seleccionar al menos una opción para generar la contraseña.');
    }

    final passwordChars = charSets.join();
    final passwordLength =
        min(length.toInt(), 50); // Asegura que la longitud no sea mayor de 50

    final password = List.generate(passwordLength, (index) {
      final randomIndex = random.nextInt(passwordChars.length);
      return passwordChars[randomIndex];
    }).join();

    return password;
  }
}
