import 'package:budget_tracker/budget_tracker.dart';
import 'package:budget_tracker/transaction.dart';
import 'package:budget_tracker/transaction_type.dart';

import 'command.dart';

class AddTransaction implements Command {
  AddTransaction({required this.budgetTracker});

  final BudgetTracker budgetTracker;
  late final Transaction _transaction;

  @override
  bool validate(String input) {
    const amountRegexp = r'[0-9]+.[0-9]+';
    const categoryRegexp = r'[a-zA-Z]+';
    const typeRegex = r'(income|expense)';
    const descriptionRegexp = r'.*';

    final regexp = RegExp(
        '^add $amountRegexp $categoryRegexp $typeRegex $descriptionRegexp\$');

    return regexp.firstMatch(input) != null;
  }

  @override
  String execute() {
    budgetTracker.addTransaction(_transaction);
    return 'done';
  }

  @override
  void parse(String input) {
    final commandSplit = input.split(RegExp(r'\s'));
    _transaction = Transaction(
        amount: double.parse(commandSplit[1]),
        category: commandSplit[2],
        type: commandSplit[3] == 'income'
            ? TransactionType.income
            : TransactionType.expense,
        description: commandSplit[4],
        date: DateTime.now());
  }
}
