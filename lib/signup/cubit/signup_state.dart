part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailValidator.pure(),
    this.isValid = false,
    this.password = const PasswordValidator.pure(),
  });

  final EmailValidator email;
  final bool isValid;
  final PasswordValidator password;

  @override
  List<Object?> get props => [email, isValid, password];

  SignUpState copyWith({
    EmailValidator? email,
    bool? isValid,
    PasswordValidator? password,
  }) {
    return SignUpState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
    );
  }
}
