import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController =  TextEditingController();

  final amountController =  TextEditingController();

  void submitData() {
    final enteredTitle  = titleController.text;
    final enteredAmount =  double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount);  // widget- accesses NNewTransaction Widget properties from _NewTransactionState
    Navigator.of(context).pop();  //Close the top screen (modal sheet)
    //context , widget are available regardless of us mentioning them
  }

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
                     onSubmitted:  (_)=>submitData(),
                      decoration: InputDecoration(
                        labelText: 'Title'
                      ),
                    ),
                    TextField(
                      controller: amountController,
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.number,
                      onSubmitted:  (_)=>submitData(),
                      decoration: InputDecoration(
                        labelText: 'Amount'
                      ),
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      onPressed:submitData,
                      textColor: Colors.redAccent,
                    )
                  ],
                ),
              )
            );
  }
}