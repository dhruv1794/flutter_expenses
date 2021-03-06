import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController =  TextEditingController();
  final _amountController =  TextEditingController();
  DateTime _selectedDate;   

  void _submitData() {
    if(_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle  = _titleController.text;
    final enteredAmount =  double.parse(_amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate  == null){
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount,_selectedDate);  // widget- accesses NewTransaction Widget properties from _NewTransactionState
    Navigator.of(context).pop();  //Close the top screen (modal sheet)
    //context , widget are available regardless of us mentioning them
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate ==null){
        return;
      }
     setState(() {
       _selectedDate  = pickedDate;
     }); 
    });
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
                      controller: _titleController,
                      cursorColor: Colors.redAccent,
                     onSubmitted:  (_)=>_submitData(),
                      decoration: InputDecoration(
                        labelText: 'Title'
                      ),
                    ),
                    TextField(
                      controller: _amountController,
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.number,
                      onSubmitted:  (_)=>_submitData(),
                      decoration: InputDecoration(
                        labelText: 'Amount'
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Row(children: <Widget>[
                        Expanded(child: Text(_selectedDate == null ?'No Date Chosen': DateFormat.yMd().format(_selectedDate))),
                        FlatButton(
                          child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: _presentDatePicker,
                        )
                      ],),
                    ),
                    RaisedButton(
                      child: Text('Add Transaction'),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed:_submitData,
                    )
                  ],
                ),
              )
            );
  }
}