import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  String? title;
  Color? color;
  List<Widget>? action;
  Function? onPressed;
  bool? centerTitle;


   CommonAppBar({Key? key, this.title, this.color, this.action, this.onPressed,this.centerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 10.w,
          height: 10.w,
          child: Image.asset('asset/image/ic_BackButton.png'),
        ),
      ),
      centerTitle: centerTitle ?? false,
      title: CommonTextView(
        title ?? '',
        fontSize: 18.sp,
        color: color,
      ),
      actions: action ?? [],
    );
  }

  /*@override

    // TODO: implement toStringShallow
  Size get preferredSize =>Size.fromHeight(8.h);*/

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
