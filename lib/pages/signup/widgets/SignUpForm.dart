import 'package:bloc_firebase_login/pages/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Sing Up Failure')),
            );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Cannot be empty';
                }
                return null;
              },
              onChanged: (value) =>
                  context.read<SignupCubit>().emailChanged(value),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Cannot be empty';
                }
                return null;
              },
              onChanged: (value) =>
                  context.read<SignupCubit>().passwordChanged(value),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    context.read<SignupCubit>().signupWithEmailAndPassword();
                  }
                },
                child: Text('Create Account')),
            SizedBox(height: 8.0),
            ElevatedButton(onPressed: () {}, child: Text('Back to Login?')),
          ],
        ),
      ),
    );
  }
}
