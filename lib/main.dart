import 'package:flutter/material.dart';


import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme:ThemeData.light().textTheme.copyWith(
          headline6 : TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          button: TextStyle(
            color: Colors.white
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(id: 't1', amount: 69.99, title: 'Shoes', date: DateTime.now()),
    // Transaction(id: 't2', amount: 19.99, title: 'Grocerry', date: DateTime.now()),
  ];
  void _addTransaction(String title, double amount, DateTime chosenDate){
    final newTransaction = Transaction(title: title, amount:amount, date: chosenDate, id:DateTime.now().toString());
    setState(() {
          _userTransaction.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element){
        return element.id == id;
      });
    });
  }


List<Transaction> get _recentTransaction  {
   return _userTransaction.where((element){
     return element.date.isAfter(
       DateTime.now().subtract(
         Duration(days: 7)
       )
     );
   }).toList();
 }

 void _startAddNewTransaction(BuildContext ctx) {
   showModalBottomSheet(context:ctx, builder:(_) {
     return GestureDetector(
       onTap:(){},
       child: NewTransaction(_addTransaction),
       behavior: HitTestBehavior.opaque
      );
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontFamily: 'OpenSans')
        ),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=>_startAddNewTransaction(context),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child:Chart(_recentTransaction),
              ),
             TransactionList(_userTransaction, _deleteTransaction)
          ],
        ),
      ),
    );
  }
}
