import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', amount: 69.99, title: 'Shoes', date: DateTime.now()),
    Transaction(id: 't2', amount: 19.99, title: 'Grocerry', date: DateTime.now()),
  ];
 final amountController = TextEditingController();
 final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child:Card(
              color: Colors.blue,
              child:Text('Chart'),
              elevation: 5
             ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        labelText: 'Title'
                      ),
                    ),
                    TextField(
                      controller: amountController,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        labelText: 'Amount'
                      ),
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      textColor: Colors.redAccent,
                    )
                  ],
                ),
              )
            ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child:Row(children: <Widget>[

                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15
                    ),
                    decoration: BoxDecoration(border:Border.all(
                      color: Colors.redAccent,
                      width: 2
                    )
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transaction.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.redAccent
                      ),
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      transaction.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction.date),
                      style: TextStyle(
                        color: Colors.blueGrey
                      )
                    ),
                  ],)
                ],)
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
