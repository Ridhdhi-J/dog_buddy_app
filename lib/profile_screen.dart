 import 'dart:io';
import 'package:dog_buddy_dog/bottombar_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_button.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_image_bottomsheet.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

// ignore: camel_case_types
class _Profile_ScreenState extends State<Profile_Screen> {
  /// EmailId TextField
  TextEditingController emailID = TextEditingController();

  /// UserName TextFiled
  TextEditingController userName = TextEditingController();

  /// Controller
  PageController riddhi = PageController();

  /// top dark green line index
  int currentPageIndex = 0;

  /// Container
  bool isVisibleDialog = true;

  /// Gender select
  int genderSelect = 0;
  File? imgList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },

        /// Appbar name Change
        title: currentPageIndex == 0
            ? txtUser
            : currentPageIndex == 1
                ? txtEmailId
                : currentPageIndex == 2
                    ? txtGender
                    : txtLocation,
        color: darkGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Linear Page Indicator
            /// pageview Indicator
            LinearPercentIndicator(
              width: 95.w,
              animateFromLastPercent: true,
              addAutomaticKeepAlive: true,
              animation: true,
              lineHeight: 13,
              percent: currentPageIndex == 0
                  ? 0.25
                  : currentPageIndex == 1
                      ? 0.50
                      : currentPageIndex == 2
                          ? 0.75
                          : 1.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: darkGreen,
              padding: EdgeInsets.only(bottom: 0.5.h),
              barRadius: const Radius.circular(5),
              alignment: MainAxisAlignment.center,
            ),

            Container(
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              height: 80.h,

              /// Pageview
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: riddhi,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                children: [
                  /// User Page
                  user(),

                  /// Email ID
                  eMailId(),

                  ///Gender
                  gender(),

                  ///Location
                  location(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  /// User Page
  Widget user() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Stack

        /// Upload a gallery and camera bottom sheet
        /// Common Bottom sheet
        CommonImageBottomSheet(
            textButton: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Camera
                /*TextButton(
                    onPressed: () async {
                      XFile? camera = await ImagePicker().pickImage(source: ImageSource.camera);
                      setState(() {
                        imgList = File(camera!.path);
                        print(File(camera.path).toString());
                        Navigator.pop(context);
                      });
                    },
                    child: CommonTextView(
                      'Camera',
                      fontSize: 16.sp,
                    )),*/
                GestureDetector(
                  onTap: () async {
                    XFile? camera = await ImagePicker().pickImage(source: ImageSource.camera);
                    setState(() {
                      imgList = File(camera!.path);
                      print(File(camera.path).toString());
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 0.50.h),
                    width: 90.w,
                    height: 5.5.h,
                    color: transparent,
                    child: CommonTextView(
                      'Camera',
                      fontSize: 16.sp,
                    ),
                  ),
                ),

                /// Gallery
                /*TextButton(
                  onPressed: () async {
                    XFile? gallery = await ImagePicker().pickImage(source: ImageSource.gallery);
                    setState(() {
                      imgList = File(gallery!.path);
                      Navigator.pop(context);
                    });
                  },
                  child: CommonTextView(
                    'gallery',
                    fontSize: 16.sp,
                  ),
                ),*/
                GestureDetector(
                  onTap: () async {
                    XFile? gallery = await ImagePicker().pickImage(source: ImageSource.gallery);
                    setState(() {
                      imgList = File(gallery!.path);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    width: 90.w,
                    height: 5.5.h,
                    color: transparent,
                    child: CommonTextView('Gallery', fontSize: 16.sp),
                  ),
                )
              ],
            ),
            column: Column(children: [
              /// File name image
              imgList != null

                  /// ClipOval Mean Circle
                  ? ClipOval(
                      child: Image.file(
                        imgList!,
                        width: 35.w,
                        height: 35.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Center(
                      child: Stack(
                        children: [
                          /// User Container
                          Container(
                            margin: EdgeInsets.only(top: 2.h, bottom: 4.h),
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(imgWhiteUser),
                              ),
                            ),
                          ),

                          /// Add Container
                          Container(
                            padding: EdgeInsets.all(1.5.w),
                            margin: EdgeInsets.only(left: 25.w, top: 3.5.h),
                            width: 6.5.w,
                            height: 6.5.w,
                            decoration: BoxDecoration(
                              color: pink,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CommonImage(imgPlus),
                          ),
                        ],
                      ),
                    ),
            ])),

        /// User Name
        CommonTextView(
          txtUserName,
          color: darkGreen,
          fontSize: 12.sp,
        ),
        SizedBox(
          height: 1.h,
        ),

        /// Common TextField
        CommonTextField(
          keyBoardType: TextInputType.text,
          nameController: userName,
          borderSide: BorderSide.none,
        ),

        /// Container use a Visibility
        /// Green Container
        Visibility(
          visible: isVisibleDialog,
          child: Container(
            margin: EdgeInsets.only(bottom: 3.h, top: 14.h),
            padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h, top: 1.h),
            width: 90.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Icon Clear
                /// Remove Container Click
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisibleDialog = false;
                    });
                  },
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.clear,
                        color: white,
                      )),
                ),
                CommonTextView(
                  txtPhoto,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: 0.90.h),

                /// List Text
                containerList(txtMakeSure),
                containerList(txtFlaseSmile),
                containerList(txtBulrryBed),
              ],
            ),
          ),
        ),
        const Spacer(),

        /// Next Button
        CommonButton(
          btnText: btnNext,
          fontSize: 12.sp,
          onPressed: () {
            riddhi.animateToPage(
              currentPageIndex + 1,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.ease,
            );
          },
        ),
      ],
    );
  }

  /// EmailID Page
  Widget eMailId() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 25.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 2.h,
              ),
              CommonTextView(
                txtYourEmail,
                fontSize: 17.sp,
                color: darkGreen,
              ),
              CommonTextView(txtSHowProfile, fontSize: 14.sp, color: darkGreen),

              /// Text EmailId
              Align(
                alignment: Alignment.topLeft,
                child: CommonTextView(txtEmailId, fontSize: 12.sp, color: darkGreen),
              ),

              /// EmailID TextFiled
              CommonTextField(
                borderSide: BorderSide.none,
                keyBoardType: TextInputType.text,
                nameController: emailID,
              ),
            ],
          ),
        ),

        /// Button Next
        CommonButton(
          btnText: btnNext,
          fontSize: 12.sp,
          onPressed: () {
            riddhi.animateToPage(currentPageIndex + 1, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
          },
        ),
      ],
    );
  }

  /// Gender Page
  Widget gender() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 2.h,
              ),

              /// Common Text
              CommonTextView(
                txtHowDoIdentify,
                fontSize: 18.sp,
                color: textColor,
              ),
              CommonTextView(txtWelcomeDogBuddy, fontSize: 14.sp, color: textColor),

              /// Common List Women
              genderList(
                txtWomen,
                genderSelect == 0 ? green : white,
                genderSelect == 0 ? white : darkGreen,
                () {
                  setState(() {
                    genderSelect = 0;
                  });
                },
              ),

              /// Common List men
              genderList(txtMen, genderSelect == 1 ? green : white, genderSelect == 1 ? white : darkGreen, () {
                setState(() {
                  genderSelect = 1;
                });
              }),

              /// Common List non binary
              genderList(txtNonBinary, genderSelect == 2 ? green : white, genderSelect == 2 ? white : darkGreen, () {
                setState(() {
                  genderSelect = 2;
                });
              }),
              SizedBox(
                height: 34.h,
              ),

              /// Common Button Next
              CommonButton(
                btnText: btnNext,
                fontSize: 12.sp,
                onPressed: () {
                  riddhi.animateToPage(currentPageIndex + 2, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Location Page
  Widget location() {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Location Container
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(100),
                ),

                /// Location Image
                child: CommonImage(
                  imgLoaction,
                  boxFit: BoxFit.none,
                ),
              ),

              /// Common Text
              CommonTextView(
                txtWhareAreYou,
                fontSize: 17.sp,
                color: textColor,
              ),
              CommonTextView(txtLoactionService, fontSize: 13.sp, color: textColor, textAlign: TextAlign.center),

              /// Container Green
              Container(
                padding: EdgeInsets.only(top: 1.5.h),
                margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
                width: 100.w,
                height: 8.5.h,
                decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(14)),

                /// Common Text
                child: CommonTextView(txtSetting, fontSize: 14.sp, color: Colors.white, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
         Spacer(),
         /// Common Submit Button
        CommonButton(
          btnText: btnSubmit,
          fontSize: 12.sp,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen()));
          },
        ),
      ],
    );
  }

  /// Gender Select List
  Widget genderList(

      /// GenderList Widgets
      String name,
      Color color,
      Color borderColor,
      Function onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },

      /// Container
      child: Container(
        margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 3.h),
        color: transparent,
        child: Container(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          width: 100.w,
          height: 7.h,
          decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextView(
                name,
                color: textColor,
                fontSize: 14.sp,
              ),

              /// Click Done Conatiner
              Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.done,
                  size: 15,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// User Container List
  Widget containerList(String name) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 4.w, top: 0.50.h),
          width: 6.5.w,
          height: 6.5.w,
          child: CommonImage(
            imgRightClick,
          ),
        ),
        CommonTextView(
          name,
          fontSize: 16.sp,
        ),
      ],
    );
  }
}
