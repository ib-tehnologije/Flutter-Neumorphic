import 'package:flutter/material.dart';

extension NeuColorExtensions on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 100);

    var realAmount = amount / 100;

    final hsl = HSLColor.fromColor(this);
    final hslDark =
        hsl.withLightness((hsl.lightness - realAmount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(double amount) {
    assert(amount >= 0 && amount <= 100);

    var realAmount = amount / 100;

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + realAmount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  MaterialColor toMaterial() => _generateMaterialColorFromColor(this);
}

MaterialColor _generateMaterialColorFromColor(Color color) {
  return MaterialColor(color.value, {
    50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
    100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
    200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
    300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
    400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
    500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
    600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
    700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
    800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
    900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
  });
}
