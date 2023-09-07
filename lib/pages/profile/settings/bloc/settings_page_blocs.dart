import 'package:app_learning_bloc/pages/profile/settings/bloc/settings_page_events.dart';
import 'package:app_learning_bloc/pages/profile/settings/bloc/settings_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsPageEvents, SettingPageStates> {
  SettingsBlocs() : super(const SettingPageStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsPageEvents events, Emitter<SettingPageStates> emit) {
    emit(const SettingPageStates());
  }
}
