import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 441,
      child: transactions.isEmpty ? 
      Column(
        children: [
          Text(
            "No transactions added yet",
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 180,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,  
            ),
          ),
        ],
      ) : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    child: FittedBox(
                      child: Text('₹'+transactions[index].amount.toStringAsFixed(2))
                    ), 
                    padding: EdgeInsets.all(10),
                  ),
                  radius: 30,
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.title, 
                ),
                subtitle: Text(
                   DateFormat.yMMMd().format(transactions[index].date),
                ),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => deleteTx(transactions[index].id), color: Theme.of(context).errorColor,),
              ),
            );
          },
          itemCount: transactions.length,
        ),
    );
  }
}












































































































// return Card(
//               child: Row(
//                 children: <Widget> [
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Theme.of(context).primaryColor, width: 2),
//                     ),
//                     child: Text(
//                       '₹'+transactions[index].amount.toStringAsFixed(2),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Theme.of(context).primaryColor,
//                       ), 
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget> [
//                       Text(
//                         transactions[index].title,
//                         style: Theme.of(context).textTheme.title,
//                       ),
//                       Text(
//                         DateFormat.yMMMd().format(transactions[index].date),
//                         style: TextStyle(
//                           color: Colors.grey
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             );