import 'package:dog_buddy_dog/widgets/common_appbar.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Dog list
// ignore: camel_case_types
class dogDetail {
  String image;

  dogDetail({required this.image});
}

class DogDetailScreen extends StatefulWidget {
  const DogDetailScreen({Key? key}) : super(key: key);

  @override
  State<DogDetailScreen> createState() => _DogDetailScreenState();
}

class _DogDetailScreenState extends State<DogDetailScreen> {
  /// Tab Controller
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommonAppBar(
          centerTitle: true,
          onPressed: () {
            Navigator.pop(context);
          },
          title: txtBabyPuppyFeed,
          color: textColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 30.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Row image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Image Container
                        Container(
                          margin: EdgeInsets.only(bottom: 2.h),
                          width: 22.w,
                          height: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CommonImage('asset/image/ic_ellipse.png'),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 53.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CommonTextView(
                                        txt308,
                                        color: textColor,
                                        fontSize: 13.sp,
                                      ),
                                      CommonTextView(
                                        txtPost,
                                        color: textColor,
                                        fontSize: 11.sp,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonTextView(
                                        txt24,
                                        color: textColor,
                                        fontSize: 13.sp,
                                      ),
                                      CommonTextView(
                                        txtFollowers,
                                        color: textColor,
                                        fontSize: 11.sp,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonTextView(
                                        txt380,
                                        color: textColor,
                                        fontSize: 13.sp,
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

                            /// Follow Container
                            Container(
                              margin: EdgeInsets.only(top: 1.h),
                              width: 54.w,
                              height: 3.8.h,
                              decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 17,
                                    color: white,
                                  ),
                                  CommonTextView(
                                    txtFollow,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CommonTextView(
                      babyPuppyFeed,
                      color: textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 0.70.h,
                    ),
                    CommonTextView(
                      txtFollowMeDailyPuppy,
                      color: textColor,
                      fontSize: 11.sp,
                    ),
                    CommonTextView(
                      txtLORUM,
                      color: textColor,
                      fontSize: 11.sp,
                    ),
                    Divider(
                      height: 3.h,
                      color: Colors.grey.shade300,
                      thickness: 0.40.w,
                    ),

                    /// TabBar
                    TabBar(
                      indicatorColor: pink,
                      indicatorWeight: 0.80.w,
                      labelPadding: EdgeInsets.only(bottom: 1.h),
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      tabs: [
                        /// Gallery Icon
                        tab('asset/image/ic_gallery.png'),

                        /// Video Icon
                        tab('asset/image/ic_video.png'),

                        /// Save Icon
                        tab('asset/image/dog_detail_save.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),

            /// TabBar View
            Expanded(
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /// Wrap
                      Wrap(
                        spacing: 0.50.w,
                        children: dogList.map((e) {
                          /// Dog Image Container
                          return Container(
                            width: 33.w,
                            height: 33.w,
                            color: Colors.pink,
                            child: CommonImage(e.image),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  color: Colors.pink,
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  color: Colors.pink,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  /// TabBar View
  Widget tab(String image) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CommonImage(image),
    );
  }
}
