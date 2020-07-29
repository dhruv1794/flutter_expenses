import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final titleController =  TextEditingController();
  final amountController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Card(
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
            );
  }
}