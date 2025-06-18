import 'package:budget_tracker/budget_tracker.dart';
import 'package:budget_tracker/commands/command.dart';

class RemoveById implements Command {
  RemoveById({required this.budgetTracker});

  late final int _id;
  final BudgetTracker budgetTracker;

  @override
  bool validate(String input) {
    final regexp = RegExp(r'^remove\s[0-9]+$');
    final match = regexp.firstMatch(input);
    return match != null;
  }

  @override
  String execute() {
    budgetTracker.removeTransactionById(_id);
    return 'done';
  }

  @override
  void parse(String input) {
    _id = int.parse(input.split(RegExp(r'\s'))[1]);
  }
}
