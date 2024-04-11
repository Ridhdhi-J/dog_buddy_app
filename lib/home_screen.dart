import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_search_dog.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Alphabet List
// ignore: camel_case_types
class alphabetList {
  String name;
  String image;

  alphabetList({required this.name, required this.image});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 1;

  /// Page Controller
  PageController screen = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
      appBar: CommonSearchDog(
        leadingWidth: 0,
        onpressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
        },
        dog: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
        },
        title: txtFriends,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// Friends List
              friendList(txtMyFriends, select == 0 ? bottomColor : Colors.white, select == 0 ? white : darkGreen, () {
                setState(() {
                  select = 0;
                  screen.animateToPage(0, duration: const Duration(microseconds: 1000), curve: Curves.easeInSine);
                });
              }, select == 0 ? white : darkGreen),

              /// Request List
              friendList(txtRequest, select == 1 ? bottomColor : white, select == 1 ? white : darkGreen, () {
                setState(() {
                  select = 1;
                  screen.animateToPage(1, duration: const Duration(microseconds: 1000), curve: Curves.easeInSine);
                });
              }, select == 1 ? white : darkGreen),

              /// Sent List
              friendList(txtSent, select == 2 ? bottomColor : white, select == 2 ? white : darkGreen, () {
                setState(() {
                  select = 2;
                  screen.animateToPage(2, duration: const Duration(microseconds: 1000), curve: Curves.easeInSine);
                });
              }, select == 2 ? white : darkGreen)
            ],
          ),

          /// Pageview
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: screen,
              children: [
                /// My Friend First Screen

                /// Alphabet scroll view
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 3.w, bottom: 2.h),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: CommonTextView(
                            txtFriendList,
                            color: textColor,
                            fontSize: 14.sp,
                          )),
                    ),
                    Expanded(
                      child: AlphabetScrollView(
                        isAlphabetsFiltered: false,
                        list: listAlphabet.map((e) => AlphaModel(e.name)).toList(),
                        alignment: LetterAlignment.left,
                        itemExtent: 19.w,
                        unselectedTextStyle: TextStyle(
                            background: Paint()
                              ..color = transparent
                              ..style = PaintingStyle.stroke
                              ..strokeJoin = StrokeJoin.miter,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        selectedTextStyle: TextStyle(
                          background: Paint()
                            ..strokeWidth = 2.h
                            ..color = bottomColor
                            ..style = PaintingStyle.stroke
                            ..strokeJoin = StrokeJoin.miter,
                          decorationThickness: 3.w,
                          color: white,
                          fontSize: 16.sp,
                          /*backgroundColor: bottomColor,*/
                        ),
                        itemBuilder: (context, index, name) {
                          return Container(
                            margin: EdgeInsets.only(left: 10.w, right: 2.w),
                            child: Row(
                              children: [
                                /// Image Container
                                Container(
                                  margin: EdgeInsets.only(right: 2.w, bottom: 1.h),
                                  width: 16.w,
                                  height: 16.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: CommonImage(
                                    listAlphabet[index].image,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextView(
                                      name,
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                    CommonTextView(
                                      txtLoreumDummy,
                                      fontSize: 10.sp,
                                      color: lightGreen,
                                    ),
                                  ],
                                ),
                                const Spacer(),

                                /// Unfriends Container
                                Container(
                                  alignment: Alignment.center,
                                  width: 20.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
                                  child: CommonTextView(
                                    txtUnFriends,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                /// Request Second Screen
                /// Wrap
                Wrap(
                  runSpacing: 2.h,
                  children: requestList.map((e) {
                    return Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: Row(
                        children: [
                          /// image Conatiner
                          Container(
                            margin: EdgeInsets.only(right: 2.w),
                            width: 14.w,
                            height: 14.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                            child: Image.asset(e),
                          ),

                          /// Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextView(
                                txtRussell,
                                fontSize: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w400,
                              ),
                              CommonTextView(
                                txtLoremLspum,
                                fontSize: 11.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const Spacer(),

                          /// Confirm Conatiner
                          Container(
                            margin: EdgeInsets.only(right: 2.w, left: 2.w),
                            alignment: Alignment.center,
                            width: 18.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CommonTextView(
                              txtConform,
                              fontSize: 10.sp,
                            ),
                          ),

                          /// Decline Container
                          Container(
                            alignment: Alignment.center,
                            width: 18.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: pink,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CommonTextView(
                              txtDecline,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                ///  Sent Third Screen
                /// Wrap
                Wrap(
                  runSpacing: 2.h,
                  children: requestList.map((e) {
                    return Container(
                      padding: EdgeInsets.only(right: 3.w, left: 3.w),
                      child: Row(
                        children: [
                          /// Image Container
                          Container(
                            margin: EdgeInsets.only(right: 2.w),
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CommonImage(e),
                          ),

                          /// Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextView(
                                txtRussell,
                                fontSize: 14.sp,
                                color: black,
                              ),
                              CommonTextView(
                                txtLoremLspum,
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const Spacer(),

                          /// Send Request Container
                          Container(
                            alignment: Alignment.center,
                            width: 25.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: CommonTextView(
                              txtRequested,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// List Row
  Widget friendList(String name, Color color, Color borderColor, Function onPressed, Color textColor) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
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
          fontSize: 13.sp,
          color: textColor,
        ),
      ),
    );
  }
}
