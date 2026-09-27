import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_data_source.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource remoteDataSource;

  SignupRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, SignupEntity>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    try {
      final model = await remoteDataSource.signUp(
        email: email,
        password: password,
        fullName: fullName,
        phone: phone,
      );
      // The model already extends entity, but we return it as an entity type
      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
