import 'package:dartz/dartz.dart';

import '../../../../core/network/supabase/supabase_manager.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart'; // Ensure these are defined
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });


  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> checkLoggedIn() async {
    return SupabaseManager.client.auth.currentUser != null;
  }
}
