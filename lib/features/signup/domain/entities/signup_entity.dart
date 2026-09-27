import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String id;
  final String email;
  final String? emailConfirmedAt;

  const SignupEntity({
    required this.id,
    required this.email,
    this.emailConfirmedAt,
  });

  @override
  List<Object?> get props => [id, email, emailConfirmedAt];
}
