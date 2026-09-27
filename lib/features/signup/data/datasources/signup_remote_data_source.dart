import '../models/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<SignupModel> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  });
}
