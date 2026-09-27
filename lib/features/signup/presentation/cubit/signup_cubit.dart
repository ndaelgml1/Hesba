import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/usecases/signup_use_case.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  Future<void> signUp({required String email, required String password, required String fullName, required String phone}) async {
    emit(SignupLoading());
    final result = await signupUseCase(email: email, password: password, fullName: fullName, phone: phone);
    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (user) async {
        // Flag that an account has been registered
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasRegisteredAccount', true);

        if (user.emailConfirmedAt == null) {
          emit(SignupEmailConfirmationRequired());
        } else {
          emit(SignupSuccess());
        }
      },
    );
  }
}
