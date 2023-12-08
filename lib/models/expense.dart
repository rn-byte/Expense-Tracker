import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

// 'enum' is the keyword that allows us to create custom type which will be
// simply predefined allowed values.
enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.leisure: Icons.movie_rounded,
  Category.travel: Icons.travel_explore_rounded,
  Category.work: Icons.work_history_rounded
};

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

  // "Getters" are basically "computed properties" => Properties thet are
  // dynamically derived, based on other class properties.
  // For formatting the 'DATE' we use third party package named "intl"

  String get formattedDate {
    return formatter.format(date);
  }
}
