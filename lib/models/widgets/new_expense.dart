import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // For dropdownButtonList
  Category? _selectedCategory;
  //Category _selectedCategory = Category.leisure;

  DateTime? _selectedDate;
  // DatePicker for IconButton
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

//------------- submitting Expense Data------------//
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null ||
        _selectedCategory == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Plese make sure valid input is entered !"),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("OK")),
            )
          ],
        ),
      );
      return;
    }
  }
//--------------submitting Expense Data end-------//

  //Storing the value entered by the user from TextField
  // 1st approach
  // var _enteredTitle = "";
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  //2nd Approach
// "TextEditingController()" is the class provided by flutter which creates
// an object for handling user input

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  //When we create TextEditingController here, we also have to tell flutter
  // to delete that controller whent the widget is not needed anymore and for
  // that we add method dispose herer

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    // Here we tell flutter that this controller is not needed anymore
    super.dispose();
  }

  //Only "State" classes can implement this "dispose" method
  // (StatelessWidget can't). That's also why you must use a StatefulWidget here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          TextField(
            // 1st approach : Add onChanged parameter to TextField which allows
            // us to register a function that will be triggered whenever the
            // value in that TextField Changes

            //Getting input on every keystroke
            //onChanged: _saveTitleInput,

            // for 2nd approach
            controller: _titleController,
            maxLength: 50,
            // for adding label, we use decoration
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rs. ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : formatter.format(_selectedDate!),
                    ),
                    // Here "!" sign to basically force DART to assume
                    // that _selectedDate won't be null
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              DropdownButton(
                  hint: const Text("Select Category"),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // for closing the ModelBottomSheet
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
