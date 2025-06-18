import 'dart:collection';

import 'package:budget_tracker/transaction.dart';
import 'package:budget_tracker/transaction_type.dart';
import 'package:collection/collection.dart';

class BudgetTracker {
  BudgetTracker(
      {Set<Transaction>? transactions, HashMap<String, double>? limits})
      : _limits = limits ?? HashMap<String, double>(),
        _transactions = transactions ?? <Transaction>{};

  final Set<Transaction> _transactions;
  final HashMap<String, double> _limits;

  bool _thisMonthPredicate(Transaction transaction) {
    return transaction.date.month == DateTime.now().month;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }

  void removeTransactionById(int id) {
    _transactions.removeWhere((x) => x.id == id);
  }

  Map<String, List<Transaction>> listAllTransactionsGroupedByCategory() {
    return groupBy(_transactions.where(_thisMonthPredicate), (x) => x.category);
  }

  void updateCategoryLimit(String category, double newLimit) {
    _limits[category] = newLimit;
  }

  /// Total income, Total expense, Net balance,
  /// Over-limit categories (if any)
  ///
  ({
    double totalIncome,
    double totalExpense,
    double netBalance,
    List<String> overLimitCategories
  }) monthlySummary() {
    final totalIncome = _transactions
        .where(_thisMonthPredicate)
        .where((x) => x.type == TransactionType.income)
        .fold(0.0, (cumulative, current) => cumulative + current.amount);

    final totalExpense = _transactions
        .where(_thisMonthPredicate)
        .where((x) => x.type == TransactionType.expense)
        .fold(0.0, (cumulative, current) => cumulative + current.amount);

    final netBalance = totalIncome - totalExpense;

    final transactionsByCategory = listAllTransactionsGroupedByCategory();

    final overLimitCategories = _limits.keys
        .where((x) =>
            transactionsByCategory[x]!
                .fold(0.0, (previousValue, e) => previousValue + e.amount) >
            _limits[x]!)
        .toList();

    return (
      totalIncome: totalIncome,
      totalExpense: totalExpense,
      netBalance: netBalance,
      overLimitCategories: overLimitCategories
    );
  }

}
