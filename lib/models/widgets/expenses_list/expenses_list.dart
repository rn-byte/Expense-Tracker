import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    // if we are unsure about the length of the List we should use this kind
    // of ListView widget insted of column
    return ListView.builder(
      itemCount: expenses.length,
      //itemBuilder: ((context, index) => Text(expenses[index].title)),
      itemBuilder: ((context, index) => ExpenseItem(expenses[index])),
    );
  }
}
