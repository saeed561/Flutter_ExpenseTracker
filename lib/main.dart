import 'package:basic_project/widget/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
var KcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 86, 180),
);
var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 6, 99, 120),
);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (fn) {
      runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kDarkScheme,
            cardTheme: const CardTheme().copyWith(
              color: kDarkScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkScheme.primaryContainer,
                foregroundColor: kDarkScheme.onPrimaryContainer,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          theme: ThemeData().copyWith(
            colorScheme: KcolorScheme,
            useMaterial3: true,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: KcolorScheme.onPrimaryContainer,
              foregroundColor: KcolorScheme.onPrimary,
            ),
            cardTheme: const CardTheme().copyWith(
              color: KcolorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
          themeMode: ThemeMode.system,
          home: Expenses(),
        ),
      );
    },
  );
}
