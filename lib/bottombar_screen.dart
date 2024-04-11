import 'package:dog_buddy_dog/go_to_park.dart';
import 'package:dog_buddy_dog/home_screen.dart';
import 'package:dog_buddy_dog/social_screen.dart';
import 'package:dog_buddy_dog/store_screen.dart';
import 'package:dog_buddy_dog/chat_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  /// select tab
  int select = 0;
  List widgetsOption = [
    const SocialScreen(),
    const HomeScreen(),
    const GoToPark(),
    const ChatScreen(),
    const StoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /// Bottom Bar
      bottomNavigationBar:

          /// Bottom Container
          Container(
        padding: EdgeInsets.only(top: 1.2.h),
        width: 100.w,
        height: 12.h,
        decoration: const BoxDecoration(
          color: bottomColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),

        /// Row Conatiner
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// List
            /// Social List
            bottomList(txtSocial, imgSocial, 0),

            /// Friend List
            bottomList(txtFriends, imgFriends, 1),

            /// Park List

            bottomList(txtPark, imgPark, 2),

            /// Chat List
            bottomList(txtChat, imgChat, 3),

            /// Stores List
            bottomList(txtStores, imgStores, 4),
          ],
        ),
      ),
      body: widgetsOption.elementAt(select),
    );
  }

  ///  Common Bottom list

  Widget bottomList(String name, String image, int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              select = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 1.h),
            padding: EdgeInsets.all(2.w),
            width: 13.w,
            height: 13.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: index == select ? textColor : lightGreen,
            ),
            child: CommonImage(image),
          ),
        ),

        /// Bottom Tab Name
        CommonTextView(
          name,
          fontSize: 11.sp,
          color: white,
        ),
      ],
    );
  }
}
