import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/model/account.dart';
import 'package:xpenso/model/category.dart';
import 'package:xpenso/model/transaction.dart';

class DataStore {
  static List<Transaction> _transactions = [
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

  static Map<String, double> _txSummation = {
    "income": 07.0,
    "expense": 10.0,
    "balance": 17.0
  };

  static Map<String, double> getTxSumForMonth(DateTime dataMonth) {
    return DataStore._txSummation;
  }

  static var _categories = const [
    Category(id: 1, title: "Food"),
    Category(id: 2, title: "Entertainment"),
    Category(id: 3, title: "Fuel"),
    Category(id: 4, title: "Shopping"),
    Category(id: 5, title: "Health"),
    Category(id: 6, title: "Travel"),
    Category(id: 7, title: "Alcohol"),
    Category(id: 8, title: "Cigarette"),
    Category(id: 1, title: "Food"),
    Category(id: 2, title: "Entertainment"),
    Category(id: 3, title: "Fuel"),
    Category(id: 4, title: "Shopping"),
    Category(id: 5, title: "Health"),
    Category(id: 6, title: "Travel"),
    Category(id: 7, title: "Alcohol"),
  ];

  static List<Category> get getCategories {
    return _categories;
  }

  static var _accounts = [
    Account(title: 'Syndicate', currBalance: 1007.0, id: 0),
    Account(title: 'Axis', currBalance: 20.7, id: 1),
    Account(title: 'Savings', currBalance: 0.0, id: 2),
  ];

  static List<Account> get getAccounts {
    return _accounts;
  }
}
