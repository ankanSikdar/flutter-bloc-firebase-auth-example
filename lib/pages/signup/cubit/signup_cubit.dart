import 'package:bloc/bloc.dart';
import 'package:bloc_firebase_login/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository _authenticationRepository;

  SignupCubit(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> signupWithEmailAndPassword() async {
    if (state.email.isEmpty || state.password.isEmpty) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: SignupStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignupStatus.error));
    }
  }
}
