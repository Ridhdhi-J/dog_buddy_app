import 'package:dog_buddy_dog/social_login_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  /// Dot Indicator
  /// Use a Skip Button
  int currentIndex = 0;

  /// PageView Controller
  PageController dog = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// BackGround Color
      backgroundColor: green,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: 0.h,
        ),

        /// Skip Button
        Container(
          margin: EdgeInsets.only(top: 5.h),
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              dog.nextPage(
                duration: const Duration(microseconds: 3),
                curve: Curves.ease,
              );
            },

            /// Text Skip
            child: CommonTextView(currentIndex == 2 ? '' : txtSkip),
          ),
        ),

        SizedBox(
          height: 70.h,

          /// PageView
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: dog,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              /// Friend Screen PageView
              PageViewList(imgFriend, txtFriend, txtLoremLpsum),

              /// Pet Screen PageView
              PageViewList(imgPet, txtPet, txtLoremLpsum),

              /// Life Screen PageView
              PageViewList(imgLife, txtLife, txtLoremLpsum),
            ],
          ),
        ),

        /// Bottom DotIndicator
        DotsIndicator(
          dotsCount: 3,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: lightYellow,
            color: darkGreen,
            spacing: const EdgeInsets.all(3),
            size: const Size.square(10.0),
            activeSize: const Size(27.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        /// Get Started Button
        Container(
          margin: EdgeInsets.only(left: 66.w, top: 10.h),
          width: 35.w,
          height: 6.5.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: lightYellow, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30)))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialLogin()));
            },

            /// Text Get Started
            child: CommonTextView(
              btnGetStarted,
              fontSize: 14.sp,
              color: black,
            ),
          ),
        ),
      ]),
    );
  }

  /// PageView List Common
  // ignore: non_constant_identifier_names
  Widget PageViewList(String image, String text, String txt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// Image
        SizedBox(
          width: 85.w,
          height: 40.h,
          child: CommonImage(image),
        ),

        /// Text Center
        CommonTextView(
          text,
          fontSize: 24.sp,
          textAlign: TextAlign.center,
        ),

        /// Small Text
        CommonTextView(
          txt,
          fontSize: 13.sp,
        ),
      ],
    );
  }
}
