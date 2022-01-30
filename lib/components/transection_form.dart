import 'package:flutter/material.dart';

class TransectionForm extends StatefulWidget {
  final void Function(String, double) addTransection;

  const TransectionForm({Key? key, required this.addTransection})
      : super(key: key);

  @override
  State<TransectionForm> createState() => _TransectionFormState();
}

class _TransectionFormState extends State<TransectionForm> {
  final _fomKey = GlobalKey<FormState>();

  void submitForm({String text = '', String value = ''}) {
    if (_fomKey.currentState?.validate() ?? false) {
      widget.addTransection(text,
          value.isNotEmpty ? double.parse(value.replaceAll(',', '.')) : 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _fomKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) =>
                  value == null || value.isEmpty ? 'campo obrigatório' : null,
              onFieldSubmitted: (value) => submitForm(text: value),
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextFormField(
              onFieldSubmitted: (value) => submitForm(value: value),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            TextButton(
              onPressed: () => submitForm(),
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
