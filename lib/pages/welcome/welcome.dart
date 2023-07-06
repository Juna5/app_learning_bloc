import 'package:app_learning_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:app_learning_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:app_learning_bloc/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "Next",
                        "First see Learning",
                        "Forget about a for of paper all knowladge in on learning",
                        "image",
                      ),
                      _page(
                        2,
                        context,
                        "Next",
                        "Connect With Everyono",
                        "Always keep in touch with your tutor & friend. Let's get connected",
                        "image",
                      ),
                      _page(
                        2,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at our discrting so study whenver you want",
                        "image",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          activeColor: Colors.blue,
                          color: Colors.grey,
                          size: const Size.square(8.0),
                          activeSize: const Size(10.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
          title,
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
          subTitle,
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
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Center(
          child: Text(
            buttonName,
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
