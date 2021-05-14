import 'package:expenses_manager/models/transaction.dart';
import 'package:expenses_manager/widgets/new_transaction.dart';
import 'package:expenses_manager/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange[700],
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now(),
      id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);  
    });

  }
  
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return  GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Manager', style: TextStyle(fontFamily: 'OpenSans'),),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Sample Chart'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
