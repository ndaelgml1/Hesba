import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/network/supabase/supabase_manager.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/signin_model.dart';
import 'signin_remote_data_source.dart';

class SigninRemoteDataSourceImpl implements SigninRemoteDataSource {
  final SupabaseClient _client = SupabaseManager.client;

  @override
  Future<SigninModel> signIn({required String email, required String password}) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('Error during sign in');
      }
      return SigninModel.fromSupabaseUser(response.user!);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
