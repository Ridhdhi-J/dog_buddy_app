import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'common_textview.dart';
import 'constants.dart';

class CommonStackTextField extends StatefulWidget{
  TextEditingController controller;
String topName;
TextInputType keyBoardType;
bool? obscureText;
  BoxBorder? boxBorder;

   CommonStackTextField({Key? key,required this.controller,required this.topName,required this.keyBoardType,this.obscureText,this.boxBorder}) : super(key: key);

  @override
  State<CommonStackTextField> createState() => _CommonStackTextFieldState();
}

class _CommonStackTextFieldState extends State<CommonStackTextField> {




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 6.5.h,
          decoration: BoxDecoration(
            color: containerColor,
            border: widget.boxBorder ?? Border.all(color: green),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 0.70.h,
          left: 3.w,
          child:CommonTextView(widget.topName,fontSize: 11.sp,color: Colors.grey,),
        ),
        Positioned(
            top: 1.3.h,
            left: 3.w,
            right: 3.w,
            child: TextField(
              keyboardType: widget.keyBoardType,
              controller: widget.controller,
              obscureText: widget.obscureText ?? false,
              obscuringCharacter: '*',
              style: TextStyle(fontSize: 12.sp,color: black),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: '',
              ),
            )
        ),
      ],
    );
  }
}