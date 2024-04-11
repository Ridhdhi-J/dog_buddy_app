import 'package:dog_buddy_dog/add_pet_profile_screen.dart';
import 'package:dog_buddy_dog/sammy_screen.dart';
import 'package:dog_buddy_dog/setting_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Story List
// ignore: camel_case_types
class listStory {
  String name;
  String image;

  listStory({required this.name, required this.image});
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    /// Tab Bar
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Row Top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.5.w),
                      margin: EdgeInsets.only(bottom: 8.h),
                      width: 10.w,
                      height: 6.h,
                      child: CommonImage(icBackButton),
                    ),
                  ),

                  /// Image
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CommonImage(icSetting),
                  ),

                  /// Setting
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.all(2.5.w),
                      width: 12.w,
                      height: 7.h,
                      child: CommonImage(imgHitendra),
                    ),
                  ),
                ],
              ),
              Align(
                  child: CommonTextView(
                txtHitendra,
                fontSize: 18.sp,
                color: textColor,
                fontWeight: FontWeight.w600,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// ic Web
                  Container(
                    padding: EdgeInsets.all(1.w),
                    width: 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CommonImage(icWeb),
                  ),
                  CommonTextView(
                    txtFollowMeDailyPuppy,
                    color: textColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// ic Location
                  SizedBox(
                    width: 6.w,
                    height: 6.w,
                    child: CommonImage(
                      icLocation,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                  CommonTextView(
                    txtLocationAddress,
                    fontSize: 12.sp,
                    color: textColor,
                  ),
                ],
              ),

              /// Edit Profile
              Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
                alignment: Alignment.center,
                width: 100.w,
                height: 5.h,
                decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(8)),
                child: CommonTextView(
                  txtEditProfile,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                ),
              ),

              /// Divider
              Divider(color: Colors.grey.shade300, indent: 1.w, endIndent: 1.w, thickness: 0.50.w, height: 4.h),
              CommonTextView(
                txtPetList,
                fontSize: 14.sp,
                color: textColor,
              ),

              /// Story Row
              Row(
                children: [
                  /// Wrap
                  Wrap(spacing: 4.w, children: [
                    /// For Loop
                    for (int i = 0; i < story.length; i++)
                      Container(
                        margin: EdgeInsets.only(top: 1.5.h),
                        width: 15.w,
                        child: Column(
                          children: [
                            /// image container
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SammyScreen()));
                              },
                              child: Container(
                                width: 15.w,
                                height: 15.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: CommonImage(story[i].image),
                              ),
                            ),

                            /// Text
                            CommonTextView(
                              story[i].name,
                              color: textColor,
                              fontSize: 12.sp,
                            )
                          ],
                        ),
                      ),

                    /// Add Pet Story Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddPetProfileScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 1.5.h),
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: CommonImage(imgAddPet),
                          ),
                        ),
                        CommonTextView(
                          txtAddPet,
                          color: pink,
                          fontSize: 12.sp,
                        ),
                      ],
                    )
                  ]),
                ],
              ),

              Divider(
                color: Colors.grey.shade300,
                height: 3.h,
                thickness: 0.50.w,
                indent: 1.w,
                endIndent: 1.w,
              ),

              /// Tab Bar
              TabBar(
                indicatorColor: Colors.pink,
                labelPadding: EdgeInsets.only(bottom: 1.h),
                indicatorWeight: 1.w,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                tabs: [
                  /// Gallery Icon
                  button('asset/image/ic_gallery.png'),

                  /// Video Icon
                  button('asset/image/ic_video.png'),

                  /// Save Icon
                  button('asset/image/use_ic_save.png'),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                /// TabBar View screen
                child: TabBarView(controller: tabController, children: [
                  /// Dog Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Wrap(
                            spacing: 0.20.w,
                            runSpacing: 0.40.h,
                            children: userGalleryList.map((e) {
                              return SizedBox(
                                width: 31.5.w,
                                height: 14.h,
                                child: CommonImage(e),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
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
      ),
    );
  }

  /// Button List TabBar
  Widget button(String image) {
    return SizedBox(
      width: 10.w,
      height: 10.w,
      child: CommonImage(image),
    );
  }
}
