import 'package:app_learning_bloc/common/apis/user_api.dart';
import 'package:app_learning_bloc/common/entities/entities.dart';
import 'package:app_learning_bloc/common/values/constant.dart';
import 'package:app_learning_bloc/common/witgets/flutter_toast.dart';
import 'package:app_learning_bloc/global.dart';
import 'package:app_learning_bloc/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
              String? displayName = user.displayName;
              String? email = user.email;
              String? id = user.uid;
              String? photoUrl = user.photoURL;

              LoginRequestEntity loginRequestEntity = LoginRequestEntity();
              loginRequestEntity.name = displayName;
              loginRequestEntity.email = email;
              loginRequestEntity.open_id = id;
              loginRequestEntity.open_id = id;

              //1 login with email
              loginRequestEntity.type = 1;
              asyncPostAllData(loginRequestEntity);
              // Global.storageService.setString(
              //     AppConstants.STORAGE_USER_TOKEN_KEY, '123123123123');

              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('/application', (route) => false);
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

void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  // EasyLoading.show(
  //   indicator: CircularProgressIndicator(),
  //   maskType: EasyLoadingMaskType.clear,
  //   dismissOnTap: true,
  // );
  var result = await UserApi.login(params: LoginRequestEntity());
}
