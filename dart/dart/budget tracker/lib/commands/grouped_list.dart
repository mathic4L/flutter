import 'package:budget_tracker/budget_tracker.dart';
import 'package:budget_tracker/commands/command.dart';

class GroupedList implements Command {
  GroupedList({required this.budgetTracker});

  final BudgetTracker budgetTracker;

  @override
  String execute() {
    return budgetTracker.listAllTransactionsGroupedByCategory().toString();
  }

  @override
  bool validate(String input) {
    return input == 'list';
  }

  @override
  void parse(String input) {}
}
