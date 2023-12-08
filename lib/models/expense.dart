import 'package:uuid/uuid.dart';

const uuid = Uuid();

// 'enum' is the keyword that allows us to create custom type which will be
// simply predefined allowed values.
enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  // initializer list : is the dart feature and uuid
  // is the third party package.
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
