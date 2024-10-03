import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');
  const EmailValidator.dirty([super.value = '']) : super.dirty();
  static final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  /// This validator method checks for, if TextField is empty and if it matches with emailRegExp.
  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value == '') {
      return EmailValidationError.empty;
    } else if (!emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    } else {
      return null;
    }
  }
}
