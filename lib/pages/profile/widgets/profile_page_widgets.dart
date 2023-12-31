import 'package:app_learning_bloc/common/routes/routes.dart';
import 'package:app_learning_bloc/common/values/colors.dart';
import 'package:app_learning_bloc/common/witgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText('Profile'),
          GestureDetector(
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/more-vertical.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    height: 80.h,
    width: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

var imagesInfo = <String, String>{
  "Settings": 'settings.png',
  "Payment Details": 'credit-card.png',
  "Achievement": 'award.png',
  "Love": 'heart(1).png',
  "Reminders": 'cube.png',
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                      'assets/icons/${imagesInfo.values.elementAt(index)}'),
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
