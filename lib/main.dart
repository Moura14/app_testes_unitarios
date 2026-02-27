import 'package:app_testes_unitarios/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_testes_unitarios/features/login/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginPage()
    );
  }
}

