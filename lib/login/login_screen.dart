import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_validation/login/cubit/login_cubit.dart';
import 'package:formz_validation/validators/email_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginCubit, LoginState>(
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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            context.read<LoginCubit>().onEmailChanged(value);
          },
          decoration: InputDecoration(
            error: state.email.displayError == EmailValidationError.empty
                ? const Text(
                    'Email is required',
                    style: TextStyle(color: Colors.redAccent),
                  )
                : state.email.displayError == EmailValidationError.invalid
                    ? const Text(
                        'Enter valid email',
                        style: TextStyle(color: Colors.redAccent),
                      )
                    : null,
            hintText: 'Enter email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
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
      onPressed: () => context.read<LoginCubit>().onSubmit(),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.blue.shade100,
        ),
      ),
      child: const Text('Submit'),
    );
  }
}
