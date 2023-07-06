import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  _page(
                    1,
                    context,
                    "next",
                    "First see Learning",
                    "Forget about a for of paper all knowladge in on learning",
                    "image",
                  ),
                  _page(
                    2,
                    context,
                    "next",
                    "First see Learning",
                    "Forget about a for of paper all knowladge in on learning",
                    "image",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _page(
  int index,
  BuildContext context,
  String buttonName,
  String title,
  String subTitle,
  String imagePath,
) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.h,
        child: const Text('page 1'),
      ),
      Container(
        child: Text(
          'First See Learning',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          'Forget about a for of paper all knowledge in one learning',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 100.h,
          left: 25.h,
          right: 25.h,
        ),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(15.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Center(
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      )
    ],
  );
}
