import 'package:bloc_firebase_login/pages/signup/cubit/signup_cubit.dart';
import 'package:bloc_firebase_login/pages/signup/widgets/SignUpForm.dart';
import 'package:bloc_firebase_login/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(
            context.read<AuthenticationRepository>(),
          ),
          child: SignUpForm(formKey: _formKey),
        ),
      ),
    );
  }
}
