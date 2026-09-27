import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final String id;
  final String houseId;
  final String categoryId;
  final double amount;
  final DateTime date;
  final String? receiptImagePath;
  final String paymentMethod; // e.g., cash, wallet, visa
  final String? notes;

  const Expense({
    required this.id,
    required this.houseId,
    required this.categoryId,
    required this.amount,
    required this.date,
    this.receiptImagePath,
    required this.paymentMethod,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        houseId,
        categoryId,
        amount,
        date,
        receiptImagePath,
        paymentMethod,
        notes,
      ];
}
