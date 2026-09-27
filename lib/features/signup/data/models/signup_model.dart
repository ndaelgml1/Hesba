import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required super.id,
    required super.email,
    super.emailConfirmedAt,
  });

  factory SignupModel.fromSupabaseUser(User user) {
    return SignupModel(
      id: user.id,
      email: user.email ?? '',
      emailConfirmedAt: user.emailConfirmedAt,
    );
  }
}
