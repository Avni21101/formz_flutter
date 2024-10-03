import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_validation/validators/email_validator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onEmailChanged(String value) {
    final email = EmailValidator.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
  }

  void onSubmit() {
    final email = EmailValidator.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );

    if (state.isValid) {
      /// api call
    }
  }
}
