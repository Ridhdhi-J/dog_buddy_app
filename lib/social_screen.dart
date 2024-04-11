import 'package:dog_buddy_dog/comment_Screen.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_search_dog.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: CommonSearchDog(
        /// Add Icon
        leading: Container(
          padding: EdgeInsets.all(2.5.w),
          width: 14.w,
          height: 6.h,
          child: CommonImage(icAdd),
        ),

        /// Search Icon
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
        },

        /// Dog Icon
        dog: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
        },
      ),
      body: Column(children: [
        /// Row Container
        Container(
          padding: EdgeInsets.only(top: 2.8.w),
          width: 100.w,
          height: 12.h,
          color: bottomColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,

            /// Wrap
            child: Wrap(
              runSpacing: 2.5.w,
              direction: Axis.vertical,
              children: [
                Column(
                  children: [
                    /// Your Story Container
                    Container(
                      padding: EdgeInsets.all(1.5.w),
                      margin: EdgeInsets.only(
                        left: 3.w,
                      ),
                      width: 14.w,
                      height: 7.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey, image: const DecorationImage(image: AssetImage(imgYourStory))),
                      child: CommonImage(imgIndicator),
                    ),
                    SizedBox(
                      height: 0.50.h,
                    ),

                    /// your story name
                    CommonTextView(
                      textYourStory,
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.sp,
                    )
                  ],
                ),

                /// for Loop
                for (int i = 0; i < storyList.length; i++)
                  Column(
                    children: [
                      /// Dotted Border
                      DottedBorder(
                        borderPadding: EdgeInsets.all(0.1.w),
                        padding: EdgeInsets.all(0.30.w),
                        strokeWidth: 0.50.w,
                        dashPattern: const [3.3],
                        borderType: BorderType.RRect,
                        color: Colors.white,
                        radius: const Radius.circular(8),

                        /// List Image
                        child: Container(
                          padding: EdgeInsets.all(0.50.w),
                          width: 14.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CommonImage(storyList[i]),
                        ),
                      ),
                      SizedBox(
                        height: 0.30.h,
                      ),
                      CommonTextView(
                        name[i],
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),

        /// Post Image
        /// ListView Separated
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Colors.grey,
            ),
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 2.5.h, left: 2.w, right: 2.w),
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        /// Dotted Border Post
                        DottedBorder(
                          strokeWidth: 0.50.w,
                          dashPattern: const [3.3],
                          borderType: BorderType.Circle,
                          color: bottomColor,
                          child: Container(
                            width: 14.w,
                            height: 14.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CommonImage(icWanda),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextView(
                              txtWandaBaker,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                            CommonTextView(
                              txtLoreum,
                              fontSize: 10.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: textfieldIconColor,
                        ),
                      ],
                    ),

                    /// Post Image List
                    Container(
                      margin: EdgeInsets.only(top: 1.h, bottom: 1.5.h),
                      alignment: Alignment.center,
                      height: 40.h,
                      child: CommonImage(
                        itemList[index],
                        boxFit: BoxFit.cover,
                      ),
                    ),

                    /// List
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Like Icon
                        postList(icLike, () {}),
                        CommonTextView(
                          txt13k,
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),

                        /// Comment Icon
                        postList(icComment, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentScreen()));
                        }),
                        CommonTextView(
                          txt21k,
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),

                        /// Share Icon
                        postList(icShare, () {}),
                        CommonTextView(
                          txt2K,
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                        const Spacer(),

                        /// Save Icon
                        postList(icSave, () {}),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CommonTextView(
                      txtLikedBy,
                      fontSize: 12.sp,
                      color: black,
                    ),
                    CommonTextView(
                      txtDogSolve,
                      fontSize: 11.sp,
                      color: Colors.pink,
                    ),

                    /// Time text
                    CommonTextView(
                      txtTime,
                      fontSize: 10.sp,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  /// List Post
  Widget postList(String image, Function? onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 1.w,
          right: 1.5.w,
        ),
        padding: EdgeInsets.all(1.7.w),
        height: 8.w,
        decoration: BoxDecoration(
          color: bottomColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: CommonImage(image),
      ),
    );
  }
}
