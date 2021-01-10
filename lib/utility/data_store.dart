import 'package:xpenso/model/transaction.dart';

class DataStore {
  static List<Transaction> _transactions = [
    Transaction(
      id: 0,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 1,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 2,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 3,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 4,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 5,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 6,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 7,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 8,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 9,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 10,
      title: "Sample",
      amount: 18,
      date: DateTime(2020, 10, 10),
    ),
    Transaction(
      id: 11,
      title: "Sample 1",
      amount: 76,
      date: DateTime(2020, 10, 10),
    ),
  ];

  static Map<String, double> _txSummation = {
    "income": 07.0,
    "expense": 10.0,
    "balance": 17.0
  };

  static List<Transaction> get txList {
    return _transactions;
  }

  static void removeTx(int txId) {
    _transactions.removeWhere((tx) => tx.id == txId);
  }

  static Map<String, double> get txSum {
    return DataStore._txSummation;
  }
}
