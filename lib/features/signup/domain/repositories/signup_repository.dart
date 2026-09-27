import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, SignupEntity>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  });
}
