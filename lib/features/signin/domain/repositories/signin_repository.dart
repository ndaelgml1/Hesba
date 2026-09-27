import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/signin_entity.dart';

abstract class SigninRepository {
  Future<Either<Failure, SigninEntity>> signIn({
    required String email,
    required String password,
  });
}
