import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/signup_entity.dart';
import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, SignupEntity>> call({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) {
    return repository.signUp(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
    );
  }
}
