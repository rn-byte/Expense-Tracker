import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
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

  //When we create TextEditingController here, we also have to tell flutter
  // to delete that controller whent the widget is not needed anymore and for
  // that we add method dispose herer

  @override
  void dispose() {
    _titleController.dispose();
    // Here we tell flutter that this controller is not needed anymore
    super.dispose();
  }

  //Only "State" classes can implement this "dispose" method
  // (StatelessWidget can't). That's also why you must use a StatefulWidget here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Cancel"),
              ),
              // const SizedBox(
              //   width: 100,
              // ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
