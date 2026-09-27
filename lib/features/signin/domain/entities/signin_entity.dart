import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String id;
  final String email;

  const SigninEntity({
    required this.id,
    required this.email,
  });

  @override
  List<Object?> get props => [id, email];
}
