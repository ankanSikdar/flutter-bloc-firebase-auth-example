import 'package:bloc_firebase_login/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/signup_cubit.dart';
import 'widgets/SignUpForm.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sing Up'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 0.0),
        child: BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(
            context.read<AuthenticationRepository>(),
          ),
          child: SingleChildScrollView(child: SignUpForm(formKey: _formKey)),
        ),
      ),
    );
  }
}
