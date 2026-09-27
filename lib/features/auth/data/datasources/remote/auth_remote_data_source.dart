import '../../../../../core/errors/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hesba/core/network/supabase/supabase_manager.dart';

abstract class AuthRemoteDataSource {
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _client = SupabaseManager.client;

  @override
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
