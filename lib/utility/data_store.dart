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
    // expense
    Category(id: 1, title: "Food", type: CategoryType.expense),
    Category(id: 2, title: "Entertainment", type: CategoryType.expense),
    Category(id: 3, title: "Fuel", type: CategoryType.expense),
    Category(id: 4, title: "Shopping", type: CategoryType.expense),
    Category(id: 5, title: "Health", type: CategoryType.expense),
    Category(id: 6, title: "Travel", type: CategoryType.expense),
    Category(id: 7, title: "Alcohol", type: CategoryType.expense),
    Category(id: 8, title: "Cigarette", type: CategoryType.expense),
    Category(id: 9, title: "Bills", type: CategoryType.expense),
    Category(id: 10, title: "Education", type: CategoryType.expense),
    Category(id: 11, title: "Transport", type: CategoryType.expense),
    Category(id: 12, title: "Pets", type: CategoryType.expense),
    Category(id: 13, title: "Office", type: CategoryType.expense),
    Category(id: 14, title: "Others", type: CategoryType.expense),

    // income
    Category(id: 15, title: "Salary", type: CategoryType.income),
    Category(id: 16, title: "Award", type: CategoryType.income),
    Category(id: 17, title: "Refund", type: CategoryType.income),
    Category(id: 18, title: "Loan Recieved", type: CategoryType.income),
    Category(id: 19, title: "Investment", type: CategoryType.income),
    Category(id: 20, title: "Pension", type: CategoryType.income),
    Category(id: 21, title: "Allowance", type: CategoryType.income),
    Category(id: 22, title: "Bonus", type: CategoryType.income),
    Category(id: 23, title: "Pocket Money", type: CategoryType.income),
    Category(id: 24, title: "Other", type: CategoryType.income),
    Category(id: 25, title: "Commission", type: CategoryType.income),
  ];

  static List<Category> getCategories(CategoryType categoryType) {
    return _categories
        .where((category) => category.type == categoryType)
        .toList();
  }

  static var _accounts = [
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
}
