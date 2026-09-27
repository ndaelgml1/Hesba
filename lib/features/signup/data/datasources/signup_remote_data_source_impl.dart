import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/network/supabase/supabase_manager.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/signup_model.dart';
import 'signup_remote_data_source.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final SupabaseClient _client = SupabaseManager.client;

  @override
  Future<SignupModel> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName, 'phone': phone},
      );
      if (response.user == null) {
        throw ServerException('Error during sign up');
      }

      return SignupModel.fromSupabaseUser(response.user!);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
