import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonTextView extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  int? maxLine;

  CommonTextView(this.text, {Key? key, this.fontWeight, this.textAlign, this.color, this.fontSize,this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? null,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
