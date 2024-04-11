import 'package:dog_buddy_dog/add_pet_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SammyScreen extends StatefulWidget {
  const SammyScreen({Key? key}) : super(key: key);

  @override
  State<SammyScreen> createState() => _SammyScreenState();
}

class _SammyScreenState extends State<SammyScreen> {
  /// Tab Bar Controller
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        /// App Bar
        appBar: CommonAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          title: txtBabyPuppyFeed,
          color: textColor,
          action: [
            Container(
              padding: EdgeInsets.all(3.5.w),
              width: 14.w,
              height: 6.h,
              child: CommonImage(icAdd),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Sammy image
                      Container(
                        margin: EdgeInsets.only(bottom: 1.h),
                        width: 22.w,
                        height: 22.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CommonImage('asset/image/2dog.png'),
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 55.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// Post
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextView(
                                      txt308,
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                    CommonTextView(
                                      txtPost,
                                      color: textColor,
                                      fontSize: 10.sp,
                                    ),
                                  ],
                                ),

                                /// Followers
                                Column(
                                  children: [
                                    CommonTextView(
                                      txt24,
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                    CommonTextView(
                                      txtFollowers,
                                      color: textColor,
                                      fontSize: 11.sp,
                                    ),
                                  ],
                                ),

                                /// Following
                                Column(
                                  children: [
                                    CommonTextView(
                                      txt380,
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                    CommonTextView(
                                      txtFollowing,
                                      color: textColor,
                                      fontSize: 11.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// Edit Profile
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 1.h),
                            width: 55.w,
                            height: 3.5.h,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CommonTextView(
                              txtEditProfile,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Text Sammy
                  CommonTextView(
                    txtSammy,
                    color: textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 1.2.h),
                  CommonTextView(
                    txtFollowMeDailyPuppy,
                    color: textColor,
                    fontSize: 10.sp,
                  ),
                  CommonTextView(
                    txtLORUM,
                    color: textColor,
                    fontSize: 10.sp,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.40.w,
                    height: 4.h,
                  ),

                  /// Tab Bar
                  TabBar(indicatorColor: pink, indicatorSize: TabBarIndicatorSize.tab, indicatorWeight: 0.70.w, labelPadding: EdgeInsets.only(bottom: 1.h), controller: tabController,

                      /// Tab three
                      tabs: [
                        /// Gallery Icon
                        tabContainer('asset/image/ic_gallery.png'),

                        /// Video Icon
                        tabContainer('asset/image/ic_video.png'),

                        /// Save Icon
                        tabContainer('asset/image/use_ic_save.png'),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),

            /// Tab BarView Screen
            Expanded(
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /// Wrap image
                      Wrap(
                        spacing: 0.80.w,
                        runSpacing: 0.10.h,
                        children: sammyList.map((e) {
                          return Container(
                            width: 32.8.w,
                            height: 32.8.w,
                            color: Colors.pink,
                            child: CommonImage(e),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 10.w,
                  height: 5.h,
                  color: Colors.pink,
                ),
                Container(
                  width: 10.w,
                  height: 5.h,
                  color: Colors.pink,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  /// List Tab Bar
  Widget tabContainer(String image) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CommonImage(image),
    );
  }
}
