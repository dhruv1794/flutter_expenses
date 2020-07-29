import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', amount: 69.99, title: 'Shoes', date: DateTime.now()),
    Transaction(id: 't2', amount: 19.99, title: 'Grocerry', date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransaction)
      ],
    );
  }
}