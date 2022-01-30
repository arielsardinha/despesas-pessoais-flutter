import 'package:expenses/models/transection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  const TransectionList(
    this.transections, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...transections.map(
          (tr) => Card(
            child: ListTile(
              leading: Container(
                width: 130,
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text(tr.title),
              subtitle: Text(DateFormat('d/MM/y').format(tr.date)),
            ),
          ),
        )
      ],
    );
  }
}
