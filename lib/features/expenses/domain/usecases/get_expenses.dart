import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpenses implements UseCase<List<Expense>, GetExpensesParams> {
  final ExpenseRepository repository;

  GetExpenses(this.repository);

  @override
  Future<Either<Failure, List<Expense>>> call(GetExpensesParams params) async {
    return await repository.getExpenses(params.houseId);
  }
}

class GetExpensesParams extends Equatable {
  final String houseId;
  const GetExpensesParams({required this.houseId});

  @override
  List<Object> get props => [houseId];
}
