import 'package:bloc_firebase_login/repositories/repositories.dart';
import 'package:bloc_firebase_login/screens/login/cubit/login_cubit.dart';
import 'package:bloc_firebase_login/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 0.0),
          child: BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              context.read<AuthenticationRepository>(),
            ),
            child: SingleChildScrollView(child: LoginForm(formKey: _formKey)),
          ),
        ),
      ),
    );
  }
}
