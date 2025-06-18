import 'package:budget_tracker/budget_tracker.dart';
import 'package:budget_tracker/commands/command.dart';

class UpdateLimit implements Command {
  UpdateLimit({required this.budgetTracker});

  final BudgetTracker budgetTracker;
  late final String _category;
  late final double _limit;

  @override
  String execute() {
    budgetTracker.updateCategoryLimit(_category, _limit);
    return 'done';
  }

  @override
  bool validate(String input) {
    final match =
        RegExp(r'update\s[a-zA-Z]+\s[0-9]+.[0-9]+').firstMatch(input);

    return match != null;
  }

  @override
  void parse(String input) {
    final commandSplit = input.split(RegExp(r'\s'));
    _category = commandSplit[1];
    _limit = double.parse(commandSplit[2]);
  }
}
