part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailValidator.pure(),
    this.isValid = false,
  });

  final EmailValidator email;
  final bool isValid;

  @override
  List<Object?> get props => [email, isValid];

  LoginState copyWith({
    EmailValidator? email,
    bool? isValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
    );
  }
}
