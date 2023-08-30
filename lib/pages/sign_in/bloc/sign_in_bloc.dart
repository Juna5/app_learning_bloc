import 'package:app_learning_bloc/pages/sign_in/bloc/sign_in_events.dart';
import 'package:app_learning_bloc/pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordlEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emith) {
    // print('ini emai ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordlEvent(PasswordEvent event, Emitter<SignInState> emith) {
    // print('ini password ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
