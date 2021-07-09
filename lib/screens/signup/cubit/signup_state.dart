part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final String error;

  const SignupState({
    @required this.email,
    @required this.password,
    @required this.status,
    @required this.error,
  });

  factory SignupState.initial() {
    return SignupState(
        email: '', password: '', status: SignupStatus.initial, error: '');
  }

  @override
  List<Object> get props => [email, password, status, error];

  SignupState copyWith({
    String email,
    String password,
    SignupStatus status,
    String error,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
