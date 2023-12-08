import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    super.key,
  });

// we need some input data here/ we need the expense data
// that should be displayed on the screen ,,, for that we add a new property to
// ExpenseItem class, which should be of type 'Expense'
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('Rs. ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                // The spacer will take all the remaining space between the
                // two widget, hence pushing the upper text to the left
                // and lower text to the right
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}