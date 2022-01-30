import 'package:expenses/components/transection_form.dart';
import 'package:expenses/components/transection_list.dart';
import 'package:expenses/models/transection.dart';
import 'package:flutter/material.dart';

class TransectionUser extends StatefulWidget {
  const TransectionUser({Key? key}) : super(key: key);

  @override
  _TransectionUserState createState() => _TransectionUserState();
}

class _TransectionUserState extends State<TransectionUser> {
  final _transection = [
    Transection(
      id: 1,
      title: 'Novo Tênis de corrida',
      value: 300.76,
      date: DateTime.now(),
    ),
    Transection(
      id: 2,
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text('Grafico'),
            elevation: 5,
          ),
        ),
        TransectionList(_transection),
        TransectionForm()
      ],
    );
  }
}
