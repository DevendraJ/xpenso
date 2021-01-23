import 'package:flutter/foundation.dart';
import 'package:xpenso/constants/category_type.dart';

class Transaction {
  int id;
  String description;
  double amount;
  DateTime txDate;
  DateTime updatedOn = DateTime.now();
  CategoryType categoryType;
  int primaryAccountId;
  int secondaryAccountId;
  int categoryId;

  Transaction({
    this.id,
    @required this.description,
    @required this.amount,
    @required this.txDate,
    @required this.categoryType,
    @required this.primaryAccountId,
    this.secondaryAccountId,
    this.categoryId,
  });
}
