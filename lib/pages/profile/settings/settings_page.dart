import 'package:app_learning_bloc/common/routes/routes.dart';
import 'package:app_learning_bloc/common/values/constant.dart';
import 'package:app_learning_bloc/global.dart';
import 'package:app_learning_bloc/pages/application/bloc/app_bloc.dart';
import 'package:app_learning_bloc/pages/application/bloc/app_events.dart';
import 'package:app_learning_bloc/pages/profile/settings/bloc/settings_page_blocs.dart';
import 'package:app_learning_bloc/pages/profile/settings/bloc/settings_page_states.dart';
import 'package:app_learning_bloc/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void logout() {
    //reset page
    context.read<AppBlocs>().add(const TriggerAppEvent(0));

    // remove token
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGNIN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingPageStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, logout),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
