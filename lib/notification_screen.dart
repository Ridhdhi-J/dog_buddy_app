 import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Row List
// ignore: camel_case_types
class notificationList {
  bool follow;
  String image;
  String nameBlack;
  String nameGreen;
  String nameGrey;
  String imgDog;

  notificationList({required this.image, required this.imgDog, required this.nameBlack, required this.nameGreen, required this.nameGrey, this.follow = false});
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: txtNotification,color: textColor,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              /// Wrap
              Wrap(
                runSpacing: 2.50.h,
                children: notifications.map((e) {
                  return Row(
                    children: [
                      /// Icon Image
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        width: 14.w,
                        height: 14.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CommonImage(e.image),
                      ),

                      /// Different Color
                      /// Rich Text Use
                      SizedBox(
                        width: 50.w,
                        child: RichText(
                          maxLines: 3,
                          text: TextSpan(text: e.nameBlack, style: TextStyle(fontSize: 12.sp, color: black), children: [
                            TextSpan(
                              text: e.nameGreen,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: textColor,
                              ),
                            ),
                            TextSpan(
                              text: e.nameGrey,
                              style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                            )
                          ]),
                        ),
                      ),

                      const Spacer(),

                      /// Boolean true False
                      e.follow
                          ? Container(
                              width: 12.w,
                              height: 12.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: CommonImage(e.imgDog),
                            )
                          :

                          /// Follow Container
                          Container(
                              alignment: Alignment.center,
                              width: 17.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                color: pink,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CommonTextView(
                                txtFollow,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
