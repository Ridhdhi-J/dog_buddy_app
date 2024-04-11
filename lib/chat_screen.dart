import 'package:dog_buddy_dog/new_contact.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:dog_buddy_dog/user_profile_screen.dart';
import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_search_dog.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// List image with name
class Dog {
  Dog({Key? key, required this.name, required this.image, required this.chatName, required this.time, this.oneMassage = false});

  String image;
  String name;
  String chatName;
  String time;
  bool oneMassage;
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// Floating Action button
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          width: 19.w,
          height: 19.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewContactScreen()));
            },
            backgroundColor: bottomColor,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
        appBar: CommonSearchDog(
          leadingWidth: 0,
          onpressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
          dog: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen()));
          },
          title: txtChat,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.30.w,
                  );
                },
                itemCount: riddhi.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            /// Dog Image
                            Container(
                              margin: EdgeInsets.only(right: 2.w, top: 1.h),
                              width: 15.w,
                              height: 15.w,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CommonImage(riddhi[index].image),
                            ),

                            /// Small Container
                            Container(
                              margin: EdgeInsets.only(left: 12.w, top: 6.h),
                              width: 3.5.w,
                              height: 3.5.w,
                              decoration: BoxDecoration(
                                color: darkgreen,
                                border: Border.all(color: white),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// List name
                            CommonTextView(
                              riddhi[index].name,
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                            CommonTextView(
                              riddhi[index].chatName,
                              fontSize: 11.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            /// List Time
                            CommonTextView(
                              riddhi[index].time,
                              fontSize: 12.sp,
                              color: lightGreen,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(0.50.w),
                              width: 6.w,
                              height: 3.h,
                              child: CommonImage(
                                riddhi[index].oneMassage ? icReciveMassage : 'asset/image/Ellipse 26.png',
                                boxFit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
