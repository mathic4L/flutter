import 'package:budget_tracker/budget_tracker.dart' as budget_tracker;
import 'package:budget_tracker/commands/add_transaction.dart';
import 'package:budget_tracker/commands/command.dart';
import 'package:budget_tracker/commands/grouped_list.dart';
import 'package:budget_tracker/commands/monthly_summary.dart';
import 'package:budget_tracker/commands/remove_by_id.dart';
import 'package:budget_tracker/commands/update_limit.dart';
import 'package:budget_tracker/io_manager.dart';
import 'package:budget_tracker/budget_tracker.dart';

void main(List<String> arguments) {
  final BudgetTracker budgetTracker = BudgetTracker();

  while (true) {
    final ioManager = IoManager();
    final input = ioManager.readRequest();

    if (input == 'exit') {
      break;
    } else {
      final commands = <Command>{
        AddTransaction(budgetTracker: budgetTracker),
        GroupedList(budgetTracker: budgetTracker),
        RemoveById(budgetTracker: budgetTracker),
        UpdateLimit(budgetTracker: budgetTracker),
        MonthlySummary(budgetTracker: budgetTracker),
      };

      final requestedCommand = commands.firstWhere((x) => x.validate(input));
      requestedCommand.parse(input);
      ioManager.myPrint(requestedCommand.execute());
    }
  }
}
