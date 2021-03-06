import 'package:bloc_firebase_login/screens/login/cubit/login_cubit.dart';
import 'package:bloc_firebase_login/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('${state.error}')),
            );
          context.read<LoginCubit>().reset();
          _formKey.currentState.reset();
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
                  context.read<LoginCubit>().emailChanged(value),
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
                  context.read<LoginCubit>().passwordChanged(value),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    context.read<LoginCubit>().logInWithCredentials();
                  }
                },
                child: Text('Login')),
            SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: Text('Create Account')),
          ],
        ),
      ),
    );
  }
}
