import 'package:app_learning_bloc/common/values/constant.dart';
import 'package:app_learning_bloc/common/witgets/flutter_toast.dart';
import 'package:app_learning_bloc/global.dart';
import 'package:app_learning_bloc/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty || password.isEmpty) {
          toastInfo(message: 'Periksa inputan kembali');
        } else {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailAddress, password: password);
            if (credential.user == null) {
              toastInfo(message: 'Email Tidak ada');
            }
            if (!credential.user!.emailVerified) {
              toastInfo(message: 'Not Varied');
              return;
            }

            var user = credential.user;
            if (user != null) {
              Global.storageService.setString(
                  AppConstants.STORAGE_USER_TOKEN_KEY, '123123123123');

              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/application', (route) => false);
            } else {
              toastInfo(message: 'User tidak ada!');
              return;
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              toastInfo(message: 'User tidak ada!');
            } else if (e.code == 'wrong-password') {
              toastInfo(message: 'Password Salah');
            } else if (e.code == 'invalid-email') {
              toastInfo(message: 'Format email salah');
            } else {
              toastInfo(message: 'error => ${e.code}');
            }
          }
        }
      }
    } catch (e) {
      print('error => ${e.toString()}');
    }
  }
}
