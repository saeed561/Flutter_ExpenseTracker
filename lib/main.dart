import 'package:basic_project/widget/Expenses.dart';
import 'package:flutter/material.dart';

var KcolorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 86, 180),
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
      cardTheme: CardTheme().copyWith(
        color: KcolorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KcolorScheme.primaryContainer,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: KcolorScheme.primary,
            ),
          ),

    ),
    home: Expenses(),
  ));
}
