import 'package:app_learning_bloc/common/witgets/flutter_toast.dart';
import 'package:app_learning_bloc/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(message: 'Username tidak boleh kosong');
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: 'Email tidak boleh kosong');
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: 'Password tidak boleh kosong');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: 'Confirm Password tidak boleh kosong');
      return;
    }

    if (password != rePassword) {
      toastInfo(message: 'Password dan confirm password beda');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            message:
                'An email has been sent to your registered email. To Activate it please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'The password provided is to week');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'Email sudah ada');
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'Email tidak valid');
      } else {
        toastInfo(message: e.code);
      }
    }
  }
}
