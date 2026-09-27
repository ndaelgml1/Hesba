import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/usecases/signin_use_case.dart';
import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase signinUseCase;

  SigninCubit({required this.signinUseCase}) : super(SigninInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());
    final result = await signinUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) async {
        // Flag that an account has been registered/logged in on this device
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasRegisteredAccount', true);
        
        emit(SigninSuccess());
      },
    );
  }
}
