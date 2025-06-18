import 'transaction_type.dart';

class Transaction {
  Transaction(
      {required this.amount,
      required this.category,
      required this.type,
      required this.description,
      required this.date})
      : id = ++previousId;

  static int previousId = -1;

  final int id;
  final double amount;
  final String category;
  final TransactionType type;
  final String description;
  final DateTime date;
}
