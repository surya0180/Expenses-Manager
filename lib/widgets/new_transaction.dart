import 'package:expenses_manager/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget> [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount'
              ),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addNewTransaction(
                  titleController.text, 
                  double.parse(amountController.text)
                );
              },
              textColor: Colors.purple, 
              child: Text("Add Transaction"),
            ),
          ],
        ),
      )
    );
  }
}