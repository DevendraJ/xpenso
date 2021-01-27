import 'package:flutter/foundation.dart' as F;
import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';

class DataStore {
  static List<Transaction> _transactions = <Transaction>[
    Transaction(
      id: 0,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 1,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 2,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 3,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 4,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 5,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 6,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 7,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 8,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 9,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 10,
      description: "Sample",
      amount: 18,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
    Transaction(
      id: 11,
      description: "Sample 1",
      amount: 76,
      txDate: DateTime(2020, 10, 10),
      categoryType: CategoryType.expense,
      primaryAccountId: 1,
    ),
  ];

  static List<Transaction> getTransactionsForMonth(DateTime dataMonth) {
    return _transactions;
  }

  static void addTx(Transaction tx) {
    _transactions.add(tx);
  }

  static void removeTx(int txId) {
    _transactions.removeWhere((tx) => tx.id == txId);
  }

  static Map<String, double> _txSummation = <String, double>{
    "income": 07.0,
    "expense": 10.0,
    "balance": 17.0
  };

  static Map<String, double> getTxSumForMonth(DateTime dataMonth) {
    return DataStore._txSummation;
  }

  static var _categories = const <Category>[
    // expense
    Category(id: 1, title: "Food", type: CategoryType.expense, imageId: 1),
    Category(
        id: 2, title: "Entertainment", type: CategoryType.expense, imageId: 2),
    Category(id: 3, title: "Fuel", type: CategoryType.expense, imageId: 3),
    Category(id: 4, title: "Shopping", type: CategoryType.expense, imageId: 4),
    Category(id: 5, title: "Health", type: CategoryType.expense, imageId: 5),
    Category(id: 6, title: "Travel", type: CategoryType.expense, imageId: 6),
    Category(id: 7, title: "Alcohol", type: CategoryType.expense, imageId: 7),
    Category(id: 8, title: "Cigarette", type: CategoryType.expense, imageId: 8),
    Category(id: 9, title: "Bills", type: CategoryType.expense, imageId: 9),
    Category(
        id: 10, title: "Education", type: CategoryType.expense, imageId: 10),
    Category(id: 11, title: "Pets", type: CategoryType.expense, imageId: 11),
    Category(id: 12, title: "Office", type: CategoryType.expense, imageId: 12),
    Category(id: 13, title: "Others", type: CategoryType.expense, imageId: 13),

    // income
    Category(id: 14, title: "Salary", type: CategoryType.income, imageId: 14),
    Category(id: 15, title: "Award", type: CategoryType.income, imageId: 15),
    Category(id: 16, title: "Refund", type: CategoryType.income, imageId: 16),
    Category(id: 17, title: "Loan", type: CategoryType.income, imageId: 17),
    Category(
        id: 18, title: "Investment", type: CategoryType.income, imageId: 18),
    Category(id: 19, title: "Pension", type: CategoryType.income, imageId: 19),
    Category(
        id: 20, title: "Allowance", type: CategoryType.income, imageId: 20),
    Category(id: 21, title: "Bonus", type: CategoryType.income, imageId: 21),
    Category(
        id: 22, title: "Pocket Money", type: CategoryType.income, imageId: 22),
    Category(
        id: 23, title: "Commission", type: CategoryType.income, imageId: 23),
    Category(id: 24, title: "Other", type: CategoryType.income, imageId: 13),
  ];

  static List<Category> getCategories(CategoryType categoryType) {
    return _categories
        .where((category) => category.type == categoryType)
        .toList();
  }

  static var _accounts = <Account>[
    Account(title: 'Syndicate', currBalance: 1007.0, id: 0),
    Account(title: 'Axis', currBalance: 20.7, id: 1),
    Account(title: 'Savings', currBalance: 0.0, id: 2),
  ];

  static List<Account> get getAccounts {
    return _accounts;
  }

  static void addAccount(Account account) {
    _accounts.add(account);
  }

  static var _images = <AppImage>[
    // expense
    AppImage(id: 1, name: 'Food', imagePath: 'assets/images/fast-food.png'),
    AppImage(
        id: 2,
        name: 'Entertainment',
        imagePath: 'assets/images/entertainment.png'),
    AppImage(id: 3, name: 'Fuel', imagePath: 'assets/images/fuel-can.png'),
    AppImage(id: 4, name: 'Shopping', imagePath: 'assets/images/shopping.png'),
    AppImage(id: 5, name: 'Health', imagePath: 'assets/images/heart.png'),
    AppImage(id: 6, name: 'Travel', imagePath: 'assets/images/transport.png'),
    AppImage(id: 7, name: 'Alcohol', imagePath: 'assets/images/drink.png'),
    AppImage(
        id: 8, name: 'Cigarette', imagePath: 'assets/images/cigarettes.png'),
    AppImage(id: 9, name: 'Bills', imagePath: 'assets/images/invoices.png'),
    AppImage(
        id: 10, name: 'Education', imagePath: 'assets/images/teaching.png'),
    AppImage(id: 11, name: 'Pets', imagePath: 'assets/images/pet.png'),
    AppImage(id: 12, name: 'Office', imagePath: 'assets/images/office.png'),
    AppImage(id: 13, name: 'Others', imagePath: 'assets/images/other.png'),

    // income
    AppImage(id: 14, name: 'Salary', imagePath: 'assets/images/salary.png'),
    AppImage(id: 15, name: 'Award', imagePath: 'assets/images/trophy.png'),
    AppImage(id: 16, name: 'Refund', imagePath: 'assets/images/money-back.png'),
    AppImage(id: 17, name: 'Loan', imagePath: 'assets/images/loan.png'),
    AppImage(
        id: 18, name: 'Investment', imagePath: 'assets/images/investing.png'),
    AppImage(id: 19, name: 'Pension', imagePath: 'assets/images/pension.png'),
    AppImage(
        id: 20, name: 'Allowance', imagePath: 'assets/images/allowance.png'),
    AppImage(id: 21, name: 'Bonus', imagePath: 'assets/images/bonus.png'),
    AppImage(
        id: 22, name: 'Pocket Money', imagePath: 'assets/images/pocket.png'),
    AppImage(
        id: 23, name: 'Commission', imagePath: 'assets/images/commission.png'),
  ];

  static AppImage getAppImage(int id) {
    try {
      return _images.firstWhere((image) => id == image.id);
    } catch (e) {
      print('image with id:$id not found');
      return _images.first;
    }
  }
}

class GenericModel {
  final int id;
  final String title;
  final int imageId;

  const GenericModel({
    @required this.title,
    this.id = 0,
    this.imageId,
  });
}

class Account extends GenericModel {
  final double currBalance;

  Account({
    @required String title,
    @required this.currBalance,
    int id,
  }) : super(title: title, id: id);
}

class Category extends GenericModel {
  final CategoryType type;

  const Category({
    this.type = CategoryType.expense,
    String title,
    int imageId,
    int id,
  }) : super(title: title, id: id, imageId: imageId);
}

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

class AppImage {
  int id;
  String name;
  String imagePath;

  AppImage({
    @F.required this.id,
    @F.required this.name,
    @F.required this.imagePath,
  });
}
