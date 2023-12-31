import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 290.44,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 123.22,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    // You can think of this context object this context value as some kind of
    // metadata collection, an object full of metadata managed by flutter that
    // belongs to a specific widget. so every widget has its own context object
    // and that contains metadata information related to the widget and very
    // important related to thee widget's position in the overall UI widget tree.
    // so this context value which we get below here holds information about the
    // upper expenses widget in the end and its position n the widget tree.
    showModalBottomSheet(
      // The modelOverlay will take the full availabel Height
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
    );
    //  'ctx' is now the context object for the model element that's created
    // by flutter
  }

  // Adding Expenses start-----------//
  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }
  //Adding Expenses end--------------//

  //Removing Expenses start--------------//
  void _removeExpenses(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });

    // for Displaying message of undoing after deleting , show that we can
    // undo the actions. For that we use ScaffoldMessenger and snackbar .
    ScaffoldMessenger.of(context).clearSnackBars();
    // for clearing the 1st snackBar before the appreance of 2nd
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpense.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }
  //Removing Expenses end--------------//

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //print(MediaQuery.of(context).size.height);
    Widget mainContent = const Center(
      child: Text("No expenses found. Start Adding Some !"),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        onRemoveExpense: _removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpense),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpense),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
