import 'package:flutter/material.dart';

class TransectionForm extends StatelessWidget {
  final valorController = TextEditingController();
  final textController = TextEditingController();
  TransectionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          TextField(
            controller: valorController,
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Nova Transação',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
