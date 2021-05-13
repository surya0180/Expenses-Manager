import 'package:expenses_manager/models/transaction.dart';
import 'package:expenses_manager/widgets/new_transaction.dart';
import 'package:expenses_manager/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 72.63, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't2', 
      title: 'Groceries', 
      amount: 68.73, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't3', 
      title: 'New Laptop', 
      amount: 89.63, 
      date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        NewTransaction(),
        TransactionList(),
      ],
    );
  }
}