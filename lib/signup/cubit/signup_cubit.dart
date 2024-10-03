import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_validation/validators/email_validator.dart';
import 'package:formz_validation/validators/password_validator.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void onEmailChange(String value) {
    final email = EmailValidator.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = PasswordValidator.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password]),
      ),
    );
  }

  void onSubmit() {
    final email = EmailValidator.dirty(state.email.value);
    final password = PasswordValidator.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
      ),
    );

    if (state.isValid) {
      /// api call
    }
  }
}
