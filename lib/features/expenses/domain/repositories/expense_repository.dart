import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/expense.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, void>> addExpense(Expense expense);
  Future<Either<Failure, List<Expense>>> getExpenses(String houseId);
  Future<Either<Failure, void>> deleteExpense(String id);
}
