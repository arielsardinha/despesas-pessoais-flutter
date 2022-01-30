import 'package:expenses/components/transection_user.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const EpensesApp());
}

class EpensesApp extends StatelessWidget {
  const EpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: const TransectionUser(),
    );
  }
}
