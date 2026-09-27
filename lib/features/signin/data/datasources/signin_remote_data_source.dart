import '../models/signin_model.dart';

abstract class SigninRemoteDataSource {
  Future<SigninModel> signIn({
    required String email,
    required String password,
  });
}
