import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'user_transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      child: transactions.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  const Text('No Transactions Added Yet!'),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset(
                      'assets/images/nothing.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      child: RPadding(
                        padding: REdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () =>
                          removeTransaction(transactions[index].id),
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                    
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
