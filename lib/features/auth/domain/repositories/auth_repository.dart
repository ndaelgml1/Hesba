import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart'; // Assuming this exists from dartz usage

abstract class AuthRepository {

  Future<Either<Failure, void>> signOut();
  Future<bool> checkLoggedIn();
}
