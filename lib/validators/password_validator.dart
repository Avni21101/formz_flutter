import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty([super.value = '']) : super.dirty();

  static final passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  /// This validator method checks for, if TextField is empty and if it matches with emailRegExp.
  @override
  PasswordValidationError? validator(String? value) {
    if (value == '' || value == null) {
      return PasswordValidationError.empty;
    } else {
      return passwordRegExp.hasMatch(value)
          ? null
          : PasswordValidationError.invalid;
    }
  }
}
