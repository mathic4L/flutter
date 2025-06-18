import 'package:budget_tracker/budget_tracker.dart';
import 'package:budget_tracker/commands/command.dart';

class MonthlySummary implements Command {
  MonthlySummary({required this.budgetTracker});

  final BudgetTracker budgetTracker;

  @override
  String execute() {
    return budgetTracker.monthlySummary().toString();
  }

  @override
  void parse(String input) {}

  @override
  bool validate(String input) {
    return input == 'summary';
  }
}
