import 'package:app_learning_bloc/common/routes/routes.dart';
import 'package:app_learning_bloc/common/values/constant.dart';
import 'package:app_learning_bloc/global.dart';
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
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm logout'),
                              content: const Text('Confirm logout'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Global.storageService.remove(
                                        AppConstants.STORAGE_USER_TOKEN_KEY);
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            AppRoutes.SIGNIN, (route) => false);
                                  },
                                  child: const Text('Confirm'),
                                )
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/icons/Logout.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
