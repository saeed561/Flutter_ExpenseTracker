import 'package:basic_project/widget/Expenses.dart';
import 'package:flutter/material.dart';

var KcolorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 98, 92, 188),
);
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: KcolorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: KcolorScheme.onPrimaryContainer,
        foregroundColor: KcolorScheme.onPrimary,
      ),
    ),
    home: Expenses(),
  ));
}
