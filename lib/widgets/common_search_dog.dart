import 'package:dog_buddy_dog/widgets/common_image.dart';
import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonSearchDog extends StatelessWidget with PreferredSizeWidget {
  String? title;
  Widget? leading;
  Function? onpressed;
  Function? dog;
  double? leadingWidth;


  CommonSearchDog({Key? key, this.title, this.leading,this.onpressed,this.dog,this.leadingWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
  leadingWidth: leadingWidth ,
      backgroundColor: Colors.transparent,
      leading: leading ?? null,
      title: CommonTextView(
        title ?? '',
        fontSize: 20.sp,
        color: textColor,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            onpressed!();
          },
          child: Container(
            padding: EdgeInsets.all(2.5.w),
            width: 12.w,
            height: 5.h,
            child: CommonImage('asset/image/ic_search.png'),
          ),
        ),
        GestureDetector(
          onTap: () {
            dog! ();
          },
          child: Container(
            padding: EdgeInsets.all(2.w),
            width: 10.w,
            height: 5.h,
            child: CommonImage('asset/image/ic_dog.png'),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(8.h);
}
