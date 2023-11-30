import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Demo App",
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: const Center(
          child: Text("Hello !"),
        ),
      ),
    ),
  );
}
