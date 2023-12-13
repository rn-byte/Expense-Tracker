import 'package:flutter/material.dart';
import 'package:expense_tracker/models/widgets/expenses.dart';

var kCOlorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kCOlorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kCOlorScheme.onPrimaryContainer,
          foregroundColor: kCOlorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kCOlorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kCOlorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kCOlorScheme.onSecondaryContainer,
                fontSize: 20,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
