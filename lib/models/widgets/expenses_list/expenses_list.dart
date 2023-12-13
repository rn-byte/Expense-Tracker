import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    // if we are unsure about the length of the List we should use this kind
    // of ListView widget insted of column
    return ListView.builder(
      itemCount: expenses.length,
      //itemBuilder: ((context, index) => Text(expenses[index].title)),

      // For swiping away or deleting the content we can use special widget
      // 'Dismissible' which we can wrap around list items that should
      // be swipeable or that should be dismissible
      itemBuilder: ((context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            // for providing key we use 'ValueKey()' constructor
            key: ValueKey(expenses[index]),
            child: ExpenseItem(
              expenses[index],
            ),
          )),
    );
  }
}
