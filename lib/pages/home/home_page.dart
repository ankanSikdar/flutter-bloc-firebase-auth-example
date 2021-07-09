import 'package:bloc_firebase_login/blocs/auth/bloc/auth_bloc.dart';
import 'package:bloc_firebase_login/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                context.read<AuthenticationRepository>().logOut();
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Text(user.email),
        ),
      ),
    );
  }
}
