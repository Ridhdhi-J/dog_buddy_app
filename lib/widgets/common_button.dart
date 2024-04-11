import 'package:dog_buddy_dog/widgets/common_textview.dart';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonButton extends StatefulWidget {
  String btnText;
  Function onPressed;
  Color? color;
  double? fontSize;

  CommonButton({Key? key, required this.btnText, this.color, required this.fontSize, required this.onPressed}) : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      width: 100.w,
      height: 6.h,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: widget.color ?? green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: CommonTextView(
          widget.btnText,
          fontSize: 14.sp,
          color: white,
        ),
      ),
    );
  }
}
