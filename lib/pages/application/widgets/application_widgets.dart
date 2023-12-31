import 'package:app_learning_bloc/common/values/colors.dart';
import 'package:app_learning_bloc/pages/home/home_page.dart';
import 'package:app_learning_bloc/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  buildBottomNavigationBarItem('Home', 'home'),
  buildBottomNavigationBarItem('Search', 'search'),
  buildBottomNavigationBarItem('Course', 'play-circle1'),
  buildBottomNavigationBarItem('Chat', 'message-circle'),
  buildBottomNavigationBarItem('Profile', 'person2'),
];

BottomNavigationBarItem buildBottomNavigationBarItem(
    String label, String iconName) {
  return BottomNavigationBarItem(
    label: label,
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/${iconName}.png'),
    ),
    activeIcon: Image.asset(
      'assets/icons/${iconName}.png',
      color: AppColors.primaryElement,
      width: 20.w,
      height: 20.h,
    ),
  );
}
