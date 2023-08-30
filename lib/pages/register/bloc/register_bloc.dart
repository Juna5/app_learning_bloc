import 'package:app_learning_bloc/pages/register/bloc/register_events.dart';
import 'package:app_learning_bloc/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterStates> emith) {
    print('username ${event.username}');
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emith) {
    print('email ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emith) {
    print('password ${event.password}');
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emith) {
    print('rePassword ${event.rePassword}');
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
