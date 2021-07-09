import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
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
              ),
              SizedBox(height: 32.0),
              ElevatedButton(onPressed: () {}, child: Text('Login')),
              SizedBox(height: 8.0),
              ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}
