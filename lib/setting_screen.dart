import 'package:dog_buddy_dog/notification_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Container List
// ignore: camel_case_types
class privacyList {
  String image;
  String name;

  privacyList({required this.image, required this.name});
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: setting,
        color: textColor,
      ),
      body: Column(
        children: [
          /// First Container Privacy
          Container(
              margin: EdgeInsets.only(right: 3.5.w, left: 3.5.w, top: 2.h),
              padding: EdgeInsets.only(left: 2.5.w, right: 2.w, top: 1.h, bottom: 1.h),
              width: 100.w,
              height: 11.h,
              decoration: BoxDecoration(color: settingBoxColor, borderRadius: BorderRadius.circular(12)),

              /// ListView Separated Privacy
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.30.w,
                    indent: 3.w,
                    endIndent: 3.w,
                  );
                },
                itemCount: privacy.length,
                itemBuilder: (BuildContext context, int index) {
                  /// Common List Row
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                      },
                      child: Container(height: 3.7.h, color: transparent, child: containerList(privacy[index].name, privacy[index].image)));
                },
              )),

          /// Second Container BlockUser
          Container(
              margin: EdgeInsets.only(right: 3.5.w, left: 3.5.w, top: 1.1.h),
              padding: EdgeInsets.only(right: 2.5.w, left: 2.w, top: 1.h, bottom: 1.h),
              width: 100.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: settingBoxColor,
                borderRadius: BorderRadius.circular(12),
              ),

              /// ListView Separated Block user
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.30.w,
                    indent: 3.w,
                    endIndent: 3.w,
                  );
                },
                itemCount: blockUser.length,
                itemBuilder: (BuildContext context, int index) {
                  return

                      /// Common Block user
                      containerList(blockUser[index].name, blockUser[index].image);
                },
              )),

          /// Third Container T&C
          Container(
              margin: EdgeInsets.only(right: 3.5.w, left: 3.5.w, top: 1.1.h),
              padding: EdgeInsets.only(right: 2.5.w, left: 2.w, top: 2.h, bottom: 2.h),
              width: 100.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: settingBoxColor,
                borderRadius: BorderRadius.circular(12),
              ),

              /// ListVIew Separated T & C
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.30.w,
                    indent: 3.w,
                    endIndent: 3.w,
                  );
                },
                itemCount: tc.length,
                itemBuilder: (BuildContext context, int index) {
                  /// Common Container T & C
                  return containerList(tc[index].name, tc[index].image);
                },
              ))
        ],
      ),
    );
  }

  /// Common List Row
  Widget containerList(String name, String image) {
    return Padding(
      padding: EdgeInsets.only(top: 1.w, right: 1.w, left: 1.w),
      child: Row(
        children: [
          /// List Image
          Container(
            margin: EdgeInsets.only(right: 4.w),
            height: 5.5.w,
            child: CommonImage(image),
          ),

          /// Common Text
          CommonTextView(
            name,
            fontSize: 15.sp,
            color: black,
          ),
          const Spacer(),

          /// Right Arrow

          Container(
            padding: EdgeInsets.all(0.50.w),
            width: 5.5.w,
            height: 5.5.w,
            child: CommonImage(
              'asset/image/ic_arrow_right.png',
              boxFit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
