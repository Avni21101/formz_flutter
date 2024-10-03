import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_validation/signup/cubit/signup_cubit.dart';
import 'package:formz_validation/signup/widgets/custom_text_field.dart';
import 'package:formz_validation/signup/widgets/error_text.dart';
import 'package:formz_validation/validators/email_validator.dart';
import 'package:formz_validation/validators/password_validator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: const [
                  FlutterLogo(size: 60),
                  SizedBox(height: 20),
                  EmailTextField(),
                  SizedBox(height: 20),
                  PasswordTextField(),
                  SizedBox(height: 20),
                  SubmitButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          onChanged: (value) =>
              context.read<SignUpCubit>().onEmailChange(value),
          errorWidget: state.email.displayError == EmailValidationError.empty
              ? const ErrorText(errorText: 'Email is required')
              : state.email.displayError == EmailValidationError.invalid
                  ? const ErrorText(errorText: 'Email is invalid')
                  : null,
          hintText: 'Enter your email',
        );
      },
    );
  }
}

const passwordError =
    'Password must be at least 8 characters long and contain at least one uppercase, one lowercase letter, one number, and one special character.';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          onChanged: (value) =>
              context.read<SignUpCubit>().onPasswordChange(value),
          errorWidget: state.password.displayError ==
                  PasswordValidationError.empty
              ? const ErrorText(errorText: 'Password is required')
              : state.password.displayError == PasswordValidationError.invalid
                  ? const ErrorText(errorText: passwordError)
                  : null,
          hintText: 'Create a password',
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<SignUpCubit>().onSubmit(),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.blue.shade100,
        ),
      ),
      child: const Text('Submit'),
    );
  }
}
