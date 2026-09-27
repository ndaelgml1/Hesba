import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/signin_entity.dart';
import '../repositories/signin_repository.dart';

class SigninUseCase {
  final SigninRepository repository;

  SigninUseCase(this.repository);

  Future<Either<Failure, SigninEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.signIn(
      email: email,
      password: password,
    );
  }
}
