import 'dart:html';
import 'dart:math';
import 'package:expenses/components/transection_form.dart';
import 'package:expenses/components/transection_list.dart';
import 'package:expenses/models/transection.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/helpers/utils.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

void main(List<String> args) {
  runApp(const EpensesApp());
}

class EpensesApp extends StatelessWidget {
  const EpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transection = <Transection>[];
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransectionForm(
            addTransection: _addTransection,
          );
        });
  }

  void _addTransection(String title, double value) {
    final newTransection = Transection(
      id: Random().nextInt(100),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transection.add(newTransection);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
        actions: [
          IconButton(
              onPressed: () {
                _openTransactionFormModal(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.8),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: TextRenderer(
                      element: ParagraphElement(),
                      text: const Text('paragrafo'),
                    ),
                    elevation: 5,
                  ),
                ),
                TransectionList(_transection),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
