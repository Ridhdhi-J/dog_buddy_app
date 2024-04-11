import 'package:dog_buddy_dog/filter_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textfield.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Common List Top
class DogTop {
  String image;
  String name;
  String name2;
  bool  adopt;
/// List Top and Pet
  DogTop({
    required this.name,
    required this.image,
    required this.name2,
    this.adopt = false
    ,
  });
}

///  List Tag
// ignore: camel_case_types
class listTag {
  String name;
  String name2;

  listTag({
    required this.name,
    required this.name2,
  });
}

class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key,th}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /// TextField Controller
  TextEditingController nameController = TextEditingController();

  /// select
  int selectName = 0;

  /// Pageview Controller
  PageController screen = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        leadingWidth: 0,

        /// TextField
        title: CommonTextField(
          keyBoardType: TextInputType.name,
          nameController: nameController,
          suffixIcon: const Icon(
            Icons.search,
            size: 30,
            color: bottomColor,
          ),
          borderSide: BorderSide.none,
        ),
        actions: [
          /// Filter Icon
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterScreen()));
            },
            child: SizedBox(
              width: 10.w,
              height: 5.h,
              child: CommonImage(
                'asset/image/ic_filter.png',
                boxFit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 1.h),

            /// Row Container
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Top Select
                listContainer(() {
                  setState(() {
                    selectName = 0;
                    screen.animateToPage(0, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  });
                }, txtTop, selectName == 0 ? bottomColor : white, selectName == 0 ? white : black, selectName == 0 ? white : black),

                /// Pet Select
                listContainer(() {
                  setState(() {
                    selectName = 1;
                    screen.animateToPage(1, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  });
                }, txtSerchPet, selectName == 1 ? bottomColor : white, selectName == 1 ? white : black, selectName == 1 ? white : black),

                /// Tag Select
                listContainer(() {
                  setState(() {
                    selectName = 2;
                    screen.animateToPage(2, duration: const Duration(milliseconds: 1000), curve: Curves.linear);
                  });
                }, txtTag, selectName == 2 ? bottomColor : white, selectName == 2 ? white : black, selectName == 2 ? white : black),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),

            /// PageView
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: screen,
                onPageChanged: (index) {},
                children: [
                  ///  Top First page
                  /// ListView Separated
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                    itemCount: topList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          /// Image Container
                          Container(
                            margin: EdgeInsets.only(right: 3.w),
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: bottomColor, width: 0.30.w),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CommonImage(topList[index].image),
                          ),

                          /// Column Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextView(
                                topList[index].name,
                                fontSize: 14.sp,
                                color: black,
                              ),
                              CommonTextView(
                                topList[index].name2,
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),

                  /// Pet Second Page
                  /// Listview Separated
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                    itemCount: topList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          /// Image Container
                          Container(
                            margin: EdgeInsets.only(right: 3.w),
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: bottomColor, width: 0.30.w),
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CommonImage(topList[index].image),
                          ),

                          /// Column Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonTextView(
                                    topList[index].name,
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  /// Adopt
                                  topList[index].adopt ?
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: pink,
                                      ),
                                      CommonTextView(txtAdopt, fontSize: 13.sp, color: pink),

                                    ],
                                  ):
                                      Container(),

                                ],
                              ),
                              CommonTextView(
                                topList[index].name2,
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),

                  /// Tag Third page
                  /// Listview separated
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Colors.grey);
                    },
                    itemCount: tagList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          /// Image Container
                          Container(
                              margin: EdgeInsets.only(right: 3.w),
                              alignment: Alignment.center,
                              width: 16.w,
                              height: 16.w,
                              decoration: BoxDecoration(
                                color: white,
                                border: Border.all(color: black, width: 0.30.w),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CommonTextView(
                                '#',
                                fontSize: 20.sp,
                                color: black,
                              )),

                          /// Column Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextView(
                                tagList[index].name,
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                              CommonTextView(
                                tagList[index].name2,
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Container list
  Widget listContainer(Function onPressed, String name, Color color, Color textColor, Color borderColor) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        width: 30.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CommonTextView(
          name,
          fontSize: 15.sp,
          color: textColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
