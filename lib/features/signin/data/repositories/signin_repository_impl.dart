import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/signin_entity.dart';
import '../../domain/repositories/signin_repository.dart';
import '../datasources/signin_remote_data_source.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SigninRemoteDataSource remoteDataSource;

  SigninRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, SigninEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
