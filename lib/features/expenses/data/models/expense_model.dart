import '../../domain/entities/expense.dart';

class ExpenseModel extends Expense {
  const ExpenseModel({
    required super.id,
    required super.houseId,
    required super.categoryId,
    required super.amount,
    required super.date,
    super.receiptImagePath,
    required super.paymentMethod,
    super.notes,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      houseId: json['houseId'],
      categoryId: json['categoryId'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      receiptImagePath: json['receiptImagePath'],
      paymentMethod: json['paymentMethod'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'houseId': houseId,
      'categoryId': categoryId,
      'amount': amount,
      'date': date.toIso8601String(),
      'receiptImagePath': receiptImagePath,
      'paymentMethod': paymentMethod,
      'notes': notes,
    };
  }

  factory ExpenseModel.fromEntity(Expense entity) {
    return ExpenseModel(
      id: entity.id,
      houseId: entity.houseId,
      categoryId: entity.categoryId,
      amount: entity.amount,
      date: entity.date,
      receiptImagePath: entity.receiptImagePath,
      paymentMethod: entity.paymentMethod,
      notes: entity.notes,
    );
  }
}
