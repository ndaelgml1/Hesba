import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/signin_entity.dart';

class SigninModel extends SigninEntity {
  const SigninModel({
    required super.id,
    required super.email,
  });

  factory SigninModel.fromSupabaseUser(User user) {
    return SigninModel(
      id: user.id,
      email: user.email ?? '',
    );
  }
}
